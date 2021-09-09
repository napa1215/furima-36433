FactoryBot.define do
  factory :order_address do
    postal_code   { '123-4567' }
    prefecture_id {1}
    city          { '多摩市' }
    address       { '1-1' }
    building      { '東京ハイツ' }
    phone         { '09012345678' }  
    token {"tok_abcdefghijk00000000000000000"}
  end
end
