# frozen_string_literal: true

class Item < ApplicationRecord
  extend Enumerize
  enumerize :category, in: { food: 0, drink: 1, other: 2 }

  belongs_to :shop
  belongs_to :supplier
  has_many :order_stocks, dependent: :destroy
  has_many :proper_stocks, dependent: :destroy
  has_many :actual_stocks

  validates :name, :supplier, :lead_time, presence: true

  after_create :initialize_proper_stock

  def self.load_not_regist_stock_items(shop)
    no_actual_stock_items = []
    shop.items.each do |item|
      no_actual_stock_items.push(item) if item.actual_stocks.where.not(quantity: nil).last.nil?
    end
    no_actual_stock_items
  end

  private

  def initialize_proper_stock
    ProperStock.date_type.values.each do |type|
      proper_stocks.create!(shop_id: shop_id, date_type: type)
    end
  end
end
