# config/puma/production.rb
environment "production"

# socketの読み込み
tmp_path = "#{File.expand_path("../../..", __FILE__)}/tmp"
bind "unix://#{tmp_path}/sockets/puma.sock"

# スレッドとワーカー数
threads 3, 3 # 最小数, 最大数
workers 2 # 起動数
preload_app!

# デーモン
daemonize true
pidfile "#{tmp_path}/pids/puma.pid"
stdout_redirect "#{tmp_path}/logs/puma.stdout.log", "#{tmp_path}/logs/puma.stderr.log", true

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart