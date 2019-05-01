(1..3).each do |i|
  Shop.seed id: i, name: "テスト店舗#{i}", email: "sample#{i}@sample.com", tel: '000-0000-0000', address:'新宿区四谷', memo:'忘れがち'
end
