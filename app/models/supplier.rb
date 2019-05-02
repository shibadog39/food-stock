# frozen_string_literal: true

class Supplier < ApplicationRecord
  belongs_to :shop
  validates :name, presence: true
end
