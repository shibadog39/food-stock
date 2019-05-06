# frozen_string_literal: true

class ActualStock < ApplicationRecord
  attr_accessor :sequence

  belongs_to :item
end
