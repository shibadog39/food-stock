# frozen_string_literal: true

class OrderStock < ApplicationRecord
  belongs_to :shop
  belongs_to :item

  validates :quantity, presence: true
end
