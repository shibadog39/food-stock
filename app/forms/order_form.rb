# frozen_string_literal: true

class OrderForm
  include ActiveModel::Model

  attr_accessor :stock_num, :proper_stock_num, :not_arrived_stock_num, :order_stock

  def initialize(item:, order_date: Date.today)
    self.stock_num = item.actual_stocks.order('counted_at').last.quantity
    self.proper_stock_num = loadProperStockNum(item, order_date)
    self.not_arrived_stock_num = loadNotArrivedStockNum(item, order_date)
    self.order_stock = findOrCreateOrderStock(item, order_date)
  end

  private

   def loadProperStockNum item, order_date
    date_type = loadOrderDateType(order_date)
    proper_stock = item.proper_stocks.find_by(date_type: date_type)
    proper_stock.quantity
   end

   def loadOrderDateType date
    # if isWeekDay
    #   if isNextDayWeekDay date

    #   else
      
    #   end
    # else
    #   if isNextDayWeekDay date

    #   else
      
    #   end
    # end
    0
   end

   def isWeekDay date

   end

   def isNextDayWeekDay date

   end

   def loadNotArrivedStockNum item, order_date
    notArrivedOrdersNum = item.order_stocks.where('delivery_date > ?', order_date.ago(item.supplier.lead_time.days))
                                           .group('item_id')
                                           .sum('quantity')
    notArrivedOrdersNum.empty? ? 0 : notArrivedOrdersNum.fetch(item.id)
   end

   def findOrCreateOrderStock item, order_date
    order_stock = item.order_stocks.find_or_create_by(delivery_date: order_date) do |order_stock|
      order_stock.shop_id = item.shop_id
      # FIXME マイナスが入るのが許容されているので修正
      order_stock.quantity = self.proper_stock_num - self.stock_num - self.not_arrived_stock_num
    end
   end

  end
