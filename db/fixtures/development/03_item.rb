(1..3).each do |i|
  Item.seed id: i, shop_id: 1, supplier_id: 1, name: "商品#{i}", category: 0, price:100, lead_time: i, memo:'めも'

  ActualStock.seed id: i, item_id: i, quantity: i*3, counted_at: Date.today
end
