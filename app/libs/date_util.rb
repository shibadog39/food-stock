class DateUtil
    class << self

        def weekday? date
            date.workday? && !HolidayJapan.check(date)
        end

        def holiday? date
            !date.workday? || HolidayJapan.check(date)
        end
    
    end
end