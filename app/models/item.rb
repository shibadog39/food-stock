# frozen_string_literal: true

class Item < ApplicationRecord
  extend Enumerize
  enumerize :category, in: { food: 0, drink: 1, other: 2 }

  belongs_to :shop
  belongs_to :supplier

  has_many :order_stocks
  has_many :proper_stocks

  validates :name, presence: true

  after_create :insert_proper_stock

  def insert_proper_stock
    @properStocks = self.proper_stocks.build([{ date_type: 0 }, { date_type: 1 }, { date_type: 2 }, { date_type: 3 }])
    @properStocks.each do |ps|
      ps.save
    end
  end

end
