# frozen_string_literal: true

class ActualStockForm
  include ActiveModel::Model

  attr_accessor :actual_stocks

  def initialize(current_shop:, target_date: Date.today, update_params: nil)
    self.actual_stocks = current_shop.items.order(sequence: :asc).map do |item|
      stock = item.actual_stocks.find_or_create_by(counted_at: target_date)

      if update_params
        stock.attributes = update_params[stock.id.to_s]
        # itemにsequenceをほぞんする
        sequence = update_params[stock.id.to_s][:sequence]
        item.update(sequence: sequence) if sequence.present?
      end

      stock
    end
  end

  def save
    return false unless valid?

    actual_stocks.map(&:save).all?
  end

  private

  def valid?
    actual_stocks.map(&:valid?).all?
  end
end
