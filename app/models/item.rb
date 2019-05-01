# frozen_string_literal: true

class Item < ApplicationRecord
  extend Enumerize
  enumerize :category, in: { food: 0, drink: 1, other: 2 }

  belongs_to :shop
  belongs_to :supplier
  validates :name, presence: true
end
