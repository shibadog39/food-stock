# frozen_string_literal: true

class Eatery::OrderStocksController < ApplicationController
  def index
    @order_collection = OrderFormCollection.new(current_shop: current_shop)
  end

  def bulk_update
    @order_collection = OrderFormCollection.new(current_shop: current_shop, update_params: order_collection_params)
    if @order_collection.save
      redirect_to eatery_order_stocks_index_path, notice: '登録しました'
    else
      render :index
    end
  end

  private

  def order_collection_params
    params
      .require(:order_form_collection)
      .permit(order_forms: [:quantity])[:order_forms]
  end
end
