# frozen_string_literal: true

class Eatery::ActualStocksController < Eatery::ApplicationController
  def index
    @stock_form = ActualStockForm.new(current_shop: current_shop, target_date: index_target_date)
  end

  def bulk_update
    @stock_form = ActualStockForm.new(current_shop: current_shop,
                                      target_date: update_target_date,
                                      update_params: stock_collection_params)
    if @stock_form.save
      redirect_to eatery_actual_stocks_path('target_date(1i)' => @target_date.year,
                                            'target_date(2i)' => @target_date.month,
                                            'target_date(3i)' => @target_date.day),
                  notice: '商品を登録しました。'
    else
      render :index
    end
  end

  private

  # rubocop:disable Naming/MemoizedInstanceVariableName
  def index_target_date
    @target_date ||=
      if params['target_date(1i)'] && params['target_date(2i)'] && params['target_date(3i)']
        Date.new(params['target_date(1i)'].to_i, params['target_date(2i)'].to_i, params['target_date(3i)'].to_i)
      else
        Date.today
      end
  end

  def update_target_date
    @target_date ||=
      if params[:actual_stock_form] && params[:actual_stock_form][:target_date]
        params[:actual_stock_form][:target_date].to_date
      else
        Date.today
      end
  end
  # rubocop:enable Naming/MemoizedInstanceVariableName

  def stock_collection_params
    params
      .require(:actual_stock_form)
      .permit(actual_stocks: %i[quantity sequence])[:actual_stocks]
  end
end
