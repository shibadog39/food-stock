# frozen_string_literal: true

class ActualStockCollection
  include ActiveModel::Model

  attr_accessor :actual_stocks

  def initialize(current_shop:, target_date: Date.today, update_params: nil)
    self.actual_stocks = current_shop.items.map do |item|
      stock = item.actual_stocks.find_or_create_by(counted_at: target_date)
      stock.attributes = update_params[stock.id.to_s] if update_params
      stock
    end
  end

  def method_name; end

  # def actual_stocks_attributes=(attributes)
  #   # a
  #   # self.actual_stocks = attributes.map do |_, stock_attributes|
  #   #   item.actual_stocks.new(stock_attributes)
  #   # end
  # end

  def save
    return false unless valid?

    actual_stocks.map(&:save).all?
  end

  private

  def valid?
    actual_stocks.map(&:valid?).all?
  end
end
