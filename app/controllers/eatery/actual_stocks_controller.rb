# frozen_string_literal: true

class Eatery::ActualStocksController < Eatery::ApplicationController
  def index
    @target_date = params[:target_date] ? params[:target_date].to_date : Date.today
    @stock_form = ActualStockForm.new(current_shop: current_shop, target_date: @target_date)
  end

  def bulk_update
    @target_date = update_target_date
    @stock_form = ActualStockForm.new(current_shop: current_shop,
                                      target_date: @target_date,
                                      update_params: stock_collection_params)
    if @stock_form.save
      redirect_to eatery_actual_stocks_path(target_date: @target_date),
                  notice: '商品を登録しました。'
    else
      render :index
    end
  end

  private

  def update_target_date
    params
      .require(:actual_stock_form)
      .permit(:target_date)[:target_date]
  end

  def stock_collection_params
    params
      .require(:actual_stock_form)
      .permit(actual_stocks: %i[quantity sequence])[:actual_stocks]
  end
end
