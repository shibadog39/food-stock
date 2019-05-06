# frozen_string_literal: true

class Eatery::ProperStocksController < ApplicationController
  def index
    @proper_collection = ProperStockCollection.new(current_shop: current_shop)
  end

  def bulk_update
    @proper_collection = ProperStockCollection.new(current_shop: current_shop, update_params: proper_collection_params)
    if @proper_collection.save
      redirect_to eatery_proper_stocks_index_path, notice: '登録しました'
    else
      render :index
    end
  end

  private
   
    def proper_collection_params
      params
        .require(:proper_stock_collection)
        .permit(proper_stocks: [:quantity])[:proper_stocks]
    end

end
