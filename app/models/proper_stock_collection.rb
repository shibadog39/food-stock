# frozen_string_literal: true

class ProperStockCollection
  include ActiveModel::Model

  attr_accessor :proper_stocks

  def initialize(current_shop:, update_params: nil)
    self.proper_stocks = current_shop.items.map do |item|
      stock_list = item.proper_stocks
      stock_list.each do |stock|
        stock.attributes = update_params[stock.id.to_s] if update_params
      end
      stock_list
    end
    proper_stocks.flatten!
  end

  def save
    return false unless valid?

    proper_stocks.map(&:save).all?
  end

  private

  def valid?
    proper_stocks.map(&:valid?).all?
  end
end
