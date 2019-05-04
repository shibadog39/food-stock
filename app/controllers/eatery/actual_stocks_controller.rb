# frozen_string_literal: true

class Eatery::ActualStocksController < Eatery::ApplicationController
  def index
    # TODO: current_shop.itemsみたいにする
    # TODO: paginationを追加する
    @items = Item.all
  end

  def update

  end
end
