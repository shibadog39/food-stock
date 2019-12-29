# frozen_string_literal: true

class Eatery::SuppliersController < Eatery::ApplicationController
  def index
    # TODO: paginationを追加する
    @suppliers = current_shop.suppliers.all
  end

  def new
    @supplier = current_shop.suppliers.new
  end

  def create
    @supplier = current_shop.suppliers.build(supplier_params)

    if @supplier.save
      redirect_to eatery_suppliers_path, notice: '登録しました'
    else
      render :new
    end
  end

  def edit
    @supplier = current_shop.suppliers.find(params[:id])
  end

  def update
    @supplier = current_shop.suppliers.find(params[:id])

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
    ).merge(shop_id: current_shop.id)
  end
end
