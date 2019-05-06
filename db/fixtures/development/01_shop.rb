(1..3).each do |i|
  # password: password
  Shop.seed id: i, name: "テスト店舗#{i}", email: "sample#{i}@sample.com", tel: '000-0000-0000', address:'新宿区四谷', memo:'忘れがち', encrypted_password: '$2a$11$d0rhOR77nVJTPr54dB4Jf.JxTw3lep5D8sssUvpi8zVfa2/Gh8wlG'
end
