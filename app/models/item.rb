# frozen_string_literal: true

class Item < ApplicationRecord
  extend Enumerize
  enumerize :category, in: { food: 0, drink: 1, other: 2 }

  belongs_to :shop
  belongs_to :supplier
  has_many :order_stocks, dependent: :destroy
  has_many :proper_stocks, dependent: :destroy
  has_many :actual_stocks

  validates :name, presence: true

  after_create :insert_proper_stock

  def insert_proper_stock
    proper_stocks = proper_stocks.build([
                                           { shop_id: shop_id, date_type: 0 },
                                           { shop_id: shop_id, date_type: 1 },
                                           { shop_id: shop_id, date_type: 2 },
                                           { shop_id: shop_id, date_type: 3 }
                                         ])
    proper_stocks.each(&:save!)
  end

  def self.load_not_regist_stock_items shop
    no_actual_stock_items = []
    shop.items.each do |item|
      no_actual_stock_items.push(item) if item.actual_stocks.where.not(quantity: nil).last.nil?
    end
    no_actual_stock_items
  end

end
