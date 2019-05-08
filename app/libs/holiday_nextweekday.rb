class HolidayNextweekday < BaseDateType
    
    private 
     
     def date_type
      ProperStock.date_type.find_value(:holidayNextWeekday).value
     end

     def applicable?(order_date)
      DateUtil.holiday?(order_date) && DateUtil.weekday?(order_date.since(1.days))
     end

end