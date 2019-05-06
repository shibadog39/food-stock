class Eatery::ProperStocksController < ApplicationController
  def index
    @items = current_shop.items
  end

  def create
    binding.pry
    puts(params)
  end

  def update
    binding.pry
    puts(params)
  end
end
