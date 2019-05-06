# frozen_string_literal: true

class Item < ApplicationRecord
  extend Enumerize
  enumerize :category, in: { food: 0, drink: 1, other: 2 }

  belongs_to :shop
  belongs_to :supplier
  has_many :order_stocks
  has_many :proper_stocks
  has_many :actual_stocks

  validates :name, presence: true

  after_create :insert_proper_stock

  def insert_proper_stock
    @properStocks = proper_stocks.build([{ shop_id: shop_id, date_type: 0 }, { shop_id: shop_id, date_type: 1 }, { shop_id: shop_id, date_type: 2 }, { shop_id: shop_id, date_type: 3 }])
    @properStocks.each(&:save!)
  end
end
