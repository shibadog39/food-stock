# frozen_string_literal: true

class Eatery::ItemsController < Eatery::ApplicationController
  before_action :validate_supplier, only: [:create, :update]

  def index
    # TODO: paginationを追加する
    @items = current_shop.items
  end

  def new
    @item = current_shop.items.new
  end

  def create
    @item = current_shop.items.build(item_params)
    return render :new if @item.invalid?

    @item.lead_time ||= @item.supplier.lead_time
    if @item.save
      redirect_to eatery_items_path, notice: '登録しました'
    else
      render :new
    end
  end

  def edit
    @item = current_shop.items.find(params[:id])
  end

  def update
    @item = current_shop.items.find(params[:id])
    if @item.update(item_params)
      redirect_to eatery_items_path, notice: '更新しました'
    else
      render :edit
    end
  end

  private

  def validate_supplier

  end

  def item_params
    params.require(:item).permit(
      :supplier_id, :name, :category, :lead_time, :price, :memo
    ).merge(shop_id: current_shop.id)
  end
end
