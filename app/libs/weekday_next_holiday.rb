class WeekdayNextHoliday < BaseDateType
    
    private 
     
     def date_type
        1
     end

     def applicable?(order_date)
      DateUtil.weekday?(order_date) && DateUtil.holiday?(order_date.since(1.days))
     end

end