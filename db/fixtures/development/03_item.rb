count = 1
(1..3).each do |i|
  Item.seed id: i, shop_id: 1, supplier_id: 1, name: "商品#{i}", category: 0, price:100, lead_time: i, memo:'めも'

  ActualStock.seed id: i, item_id: i, quantity: i*3, counted_at: Date.today
  
  (0..3).each do |n|
    ProperStock.seed id: count, item_id: i, date_type: n.to_i, quantity: i*3
    count = count+1
  end

end
