# frozen_string_literal: true

class Eatery::OrderStocksController < ApplicationController
  def index
    @order_collection = OrderFormCollection.new(current_shop: current_shop)
  end

  def bulk_update
   a
  end

end
