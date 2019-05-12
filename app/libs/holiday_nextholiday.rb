# frozen_string_literal: true

class HolidayNextholiday < BaseDateType
  private

  def date_type
    ProperStock.date_type.find_value(:holidayNextHoliday).value
  end

  def applicable?(order_date)
    DateUtil.holiday?(order_date) && DateUtil.holiday?(order_date.since(1.days))
  end
end
