# frozen_string_literal: true

class Eatery::ProperStocksController < ApplicationController
  def index
    @items = current_shop.items
  end

  def create; end

  def update; end
end
