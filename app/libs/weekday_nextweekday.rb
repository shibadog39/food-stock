class WeekdayNextweekday < BaseDateType
    
    private 
     
     def date_type
        
        0
     end

     def applicable?(order_date)
      DateUtil.weekday?(order_date) && DateUtil.weekday?(order_date.since(1.days))
     end

end