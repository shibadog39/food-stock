# frozen_string_literal: true

class BaseDateType
  attr_reader :successor

  def initialize(successor = nil)
    @successor = successor
  end

  def call(order_date)
    return successor.call(order_date) unless applicable?(order_date)

    date_type
  end
end
