# frozen_string_literal: true

class OrderForm
  include ActiveModel::Model

  attr_accessor :order_stock, :stock_num, :proper_stock_num, :not_arrived_stock_num

  def initialize(item:, order_date: Date.today)
    self.stock_num = item.actual_stocks.order('counted_at').last.quantity
    self.proper_stock_num = loadProperStockNum(item, order_date)
    self.not_arrived_stock_num = loadNotArrivedStockNum(item, order_date)

    self.order_stock = item.order_stocks.find_or_initialize_by(delivery_date: order_date)
    if self.order_stock.new_record?
      self.order_stock.quantity = self.proper_stock_num - self.stock_num - self.not_arrived_stock_num
      self.order_stock.save
    end
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
    lead_time = item.supplier.lead_time
    # not_arrived_date = order_date.ago(lead_time.days)
    not_arrived_date = order_date.ago(100.days)
    notArrivedOrdersNum = item.order_stocks.where('delivery_date > ?', not_arrived_date).group('item_id').sum('quantity')
    a
   end

  end
