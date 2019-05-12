# frozen_string_literal: true

class Eatery::OrderStocksController < ApplicationController
  def index
    @delivery_date = params[:delivery_date] ? params[:delivery_date].to_date : Date.today
    @order_collection = OrderFormCollection.new(current_shop: current_shop, delivery_date: @delivery_date)
  end

  def bulk_update
    @delivery_date = params[:order_form_collection][:delivery_date].to_date
    @order_collection = OrderFormCollection.new(current_shop: current_shop,
                                                delivery_date: @delivery_date,
                                                update_params: order_collection_params)
    if @order_collection.save
      redirect_to eatery_order_stocks_index_path(delivery_date: @delivery_date), notice: '登録しました'
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
