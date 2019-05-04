class ProperStock < ApplicationRecord
  extend Enumerize
  enumerize :date_type, in: { weekdayNextWeekday: 0, weekdayNextHoliday: 1, holidayNextWeekday: 2, holidayNextHoliday: 3 }

  belongs_to :shop
  belongs_to :item
end
