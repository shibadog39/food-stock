# frozen_string_literal: true

class OrderFormCollection
    include ActiveModel::Model
  
    attr_accessor :order_forms
  
    def initialize(current_shop:, target_date: Date.today, update_params: nil)
      self.order_forms = current_shop.items.map do |item|
        form = OrderForm.new(item: item)
        form.attributes = update_params[stock.id.to_s] if update_params
        form
      end
    end
  
    def save
      return false unless valid?
      actual_stocks.map(&:save).all?
    end
  
    private
  
    def valid?
      actual_stocks.map(&:valid?).all?
    end
  end
  