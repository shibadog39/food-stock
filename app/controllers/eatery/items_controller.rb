# frozen_string_literal: true

class Eatery::ItemsController < Eatery::ApplicationController
  def index
    # TODO: current_shop.itemsみたいにする
    # TODO: paginationを追加する
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    # TODO: current_shop.suppliers.new()みたいにする
    @item = Item.new(item_params)
    if @item.save
      redirect_to eatery_items_path, notice: '登録しました'
    else
      render :new
    end
  end

  def edit
    # TODO: current_shop.items.find()みたいにする
    @item = Item.find(params[:id])
  end

  def update
    # TODO: current_shop.items.find()みたいにする
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to eatery_items_path, notice: '更新しました'
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :supplier_id, :name, :category, :lead_time, :price, :memo
    ).merge(shop_id: 1)
  end
end
