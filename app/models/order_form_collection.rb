# frozen_string_literal: true

class OrderFormCollection
  include ActiveModel::Model

  attr_accessor :order_forms

  def initialize(registed_stock_items:, order_date:, update_params: nil)
    self.order_forms = registed_stock_items.map do |item|
      form = OrderForm.new(item: item, order_date: order_date)
      form.order_stock.attributes = update_params[form.order_stock.id.to_s] if update_params
      form
    end
  end

  def save
    order_stocks = order_forms.map(&:order_stock)
    return false unless valid? order_stocks

    order_stocks.map(&:save).all?
  end

  private

  def valid?(order_stocks)
    order_stocks.map(&:valid?).all?
  end
end
