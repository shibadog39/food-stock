# frozen_string_literal: true

class OrderFormCollection
    include ActiveModel::Model
  
    attr_accessor :order_forms
  
    def initialize(current_shop:, delivery_date: Date.today, update_params: nil)
      self.order_forms = current_shop.items.map do |item|
        form = OrderForm.new(item: item, delivery_date: delivery_date)
        form.order_stock.attributes = update_params[form.order_stock.id.to_s] if update_params
        form
      end
    end
  
    def save
      order_stocks = order_forms.map(&:order_stock)
      return false unless valid? order_stocks
      order_stocks.map(&:save).all?
    end
  
    private
  
    def valid? order_stocks
      order_stocks.map(&:valid?).all?
    end

  end
  