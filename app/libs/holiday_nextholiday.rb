class HolidayNextholiday < BaseDateType
    
    private 
     
     def date_type
        3
     end

     def applicable?(order_date)
      DateUtil.holiday?(order_date) && DateUtil.holiday?(order_date.since(1.days))
     end
end