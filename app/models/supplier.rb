# frozen_string_literal: true

class Supplier < ApplicationRecord
  belongs_to :shop
  has_many :items
  validates :name, presence: true
end
