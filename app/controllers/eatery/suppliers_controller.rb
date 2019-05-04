# frozen_string_literal: true

class Eatery::SuppliersController < Eatery::ApplicationController
  def index
    # TODO: current_shop.suppliersみたいにする
    # TODO: paginationを追加する
    @suppliers = current_shop.suppliers.all
  end

  def new
    @supplier = Supplier.new
  end

  def create
    # TODO: current_shop.suppliers.new()みたいにする
    @supplier = current_shop.suppliers.build(supplier_params)

    if @supplier.save
      redirect_to eatery_suppliers_path, notice: '登録しました'
    else
      render :new
    end
  end

  def edit
    # TODO: current_shop.suppliers.find()みたいにする
    @supplier = Supplier.find(params[:id])
  end

  def update
    # TODO: current_shop.suppliers.find()みたいにする
    @supplier = Supplier.find(params[:id])

    if @supplier.update(supplier_params)
      redirect_to eatery_suppliers_path, notice: '更新しました'
    else
      render :edit
    end
  end

  private

  def supplier_params
    params.require(:supplier).permit(
      :name, :tel, :fax, :email, :lead_time, :memo
    ).merge(shop_id: 1)
  end
end
