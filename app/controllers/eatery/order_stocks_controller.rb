# frozen_string_literal: true

class Eatery::OrderStocksController < ApplicationController
  before_action :check_actual_stock

  def index
    @order_date = params[:order_date] ? params[:order_date].to_date : Date.today
    @order_collection = OrderFormCollection.new(registed_stock_items: @registed_stock_items, order_date: @order_date)
  end

  def bulk_update
    @order_date = params[:order_form_collection][:order_date].to_date
    @order_collection = OrderFormCollection.new(registed_stock_items: @registed_stock_items,
                                                order_date: @order_date,
                                                update_params: order_collection_params)
    if @order_collection.save
      redirect_to eatery_order_stocks_index_path(order_date: @order_date), notice: '登録しました'
    else
      render :index
    end
  end

  private

  def check_actual_stock
    @not_regist_stock_items = Item.load_not_regist_stock_items(current_shop)
    @registed_stock_items = current_shop.items.where.not(id: @not_regist_stock_items.map(&:id))
  end

  def order_collection_params
    params
      .require(:order_form_collection)
      .permit(order_forms: [:quantity])[:order_forms]
  end
end
