require 'optparse'

module HamlLint
  # Handles option parsing for the command line application.
  class Options
    # Parses command line options into an options hash.
    #
    # @param args [Array<String>] arguments passed via the command line
    # @return [Hash] parsed options
    def parse(args)
      @options = {}

      OptionParser.new do |parser|
        parser.banner = "Usage: #{APP_NAME} [options] [file1, file2, ...]"

        add_linter_options parser
        add_report_options parser
        add_file_options parser
        add_logger_options parser
        add_info_options parser
      end.parse!(args)

      # Any remaining arguments are assumed to be files
      @options[:files] = args.empty? ? ['.'] : args

      @options
    rescue OptionParser::InvalidOption => ex
      raise Exceptions::InvalidCLIOption,
            ex.message,
            ex.backtrace
    end

    private

    def add_linter_options(parser)
      parser.on('--auto-gen-config', 'Generate a configuration file acting as a TODO list') do
        @options[:auto_gen_config] = true
      end

      parser.on('-i', '--include-linter linter,...', Array,
                'Specify which linters you want to run') do |linters|
        @options[:included_linters] = linters
      end

      parser.on('-x', '--exclude-linter linter,...', Array,
                "Specify which linters you don't want to run") do |linters|
        @options[:excluded_linters] = linters
      end
    end

    def add_report_options(parser)
      reporters = HamlLint::Reporter.available.map(&:cli_name).sort
      parser.on('-r', '--reporter reporter', String,
                'Specify which reporter you want to use to generate the output. One of:',
                *reporters.map { |name| "  - #{name}" }) do |reporter|
        @options[:reporter] = load_reporter_class(reporter.capitalize)
      end

      parser.on('--fail-fast', 'Fail after the first file with lint at or above the fail level') do
        @options[:fail_fast] = true
      end

      parser.on('--fail-level fail_level', String,
                'Specify which level (warning or error) you want the suite to fail') do |fail_level|
        @options[:fail_level] = HamlLint::Severity.new(fail_level.to_sym)
      end
    end

    # Returns the class of the specified Reporter.
    #
    # @param reporter_name [String]
    # @raise [HamlLint::Exceptions::InvalidCLIOption] if reporter doesn't exist
    # @return [Class]
    def load_reporter_class(reporter_name)
      HamlLint::Reporter.const_get("#{reporter_name}Reporter")
    rescue NameError
      raise HamlLint::Exceptions::InvalidCLIOption,
            "#{reporter_name}Reporter does not exist"
    end

    def add_file_options(parser)
      parser.on('-c', '--config config-file', String,
                'Specify which configuration file you want to use') do |conf_file|
        @options[:config_file] = conf_file
      end

      parser.on('-e', '--exclude file,...', Array,
                'List of file names to exclude') do |files|
        @options[:excluded_files] = files
      end
    end

    def add_info_options(parser)
      parser.on('--show-linters', 'Display available linters') do
        @options[:show_linters] = true
      end

      parser.on('--show-reporters', 'Display available reporters') do
        @options[:show_reporters] = true
      end

      parser.on_tail('-h', '--help', 'Display help documentation') do
        @options[:help] = parser.help
      end

      parser.on_tail('-v', '--version', 'Display version') do
        @options[:version] = true
      end

      parser.on_tail('-V', '--verbose-version', 'Display verbose version information') do
        @options[:verbose_version] = true
      end
    end

    def add_logger_options(parser)
      parser.on('--[no-]color', 'Force output to be colorized') do |color|
        @options[:color] = color
      end

      parser.on('--[no-]summary', 'Print a summary of your linting report') do |summary|
        @options[:summary] = summary
      end
    end
  end
end
