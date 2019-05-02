(1..3).each do |i|
  Supplier.seed id: i, shop_id: 1, name: "仕入先#{i}", email: "sample#{i}@sample.com", tel: '000-0000-0000', fax: '000-0000-0000', lead_time: i, memo:'めも'
end
