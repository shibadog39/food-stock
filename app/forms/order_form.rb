# frozen_string_literal: true

class OrderForm
  include ActiveModel::Model

  attr_accessor :stock_num, :proper_stock_num, :not_arrived_stock_num, :order_stock

  def initialize(item:, order_date:)
    delivery_date = order_date.since(item.lead_time.days)
    self.stock_num = item.actual_stocks.where.not(quantity: nil).order('counted_at').last.quantity
    self.proper_stock_num = load_proper_stock_num(item, delivery_date)
    self.not_arrived_stock_num = load_not_arrived_stock_num(item, order_date)
    self.order_stock = find_or_create_order_stock(item, order_date, delivery_date)
  end

  private

  def load_proper_stock_num(item, delivery_date)
    chain = WeekdayNextweekday.new(WeekdayNextHoliday.new(HolidayNextweekday.new(HolidayNextholiday.new)))
    date_type = chain.call(delivery_date)
    item.proper_stocks.find_by(date_type: date_type).quantity
  end

  def load_not_arrived_stock_num(item, order_date)
    not_arrived_orders_num = item.order_stocks.where('order_date > ?', order_date.ago(item.lead_time.days))
                                 .group('item_id')
                                 .sum('quantity')
    not_arrived_orders_num.empty? ? 0 : not_arrived_orders_num.fetch(item.id)
  end

  def find_or_create_order_stock(item, order_date, delivery_date)
    item.order_stocks.find_or_create_by(order_date: order_date) do |order_stock|
      order_stock.shop_id = item.shop_id
      quantity = proper_stock_num - stock_num - not_arrived_stock_num
      order_stock.quantity = quantity.positive? ? quantity : 0
      order_stock.delivery_date = delivery_date
    end
  end
end
