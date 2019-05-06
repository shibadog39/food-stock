# frozen_string_literal: true

class OrderForm
  include ActiveModel::Model

  attr_accessor :item_name, :stock_num, :proper_stock_num, :order_num

  def save
    return false if invalid?

    # 保存, 通知, ロギング等
    true
  end
  end
