# frozen_string_literal: true

class WeekdayNextweekday < BaseDateType
  private

  def date_type
    ProperStock.date_type.find_value(:weekdayNextWeekday).value
  end

  def applicable?(order_date)
    DateUtil.weekday?(order_date) && DateUtil.weekday?(order_date.since(1.days))
  end
end
