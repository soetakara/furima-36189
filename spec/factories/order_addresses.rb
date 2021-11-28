FactoryBot.define do
  factory :order_address do
    postal_code           {"123-4567"}
    prefecture_id         {Faker::Number.between(from: 2, to: 48)}
    municipality          {"横浜市緑区"}
    house_number          {"青山1-1-1"}
    building_name         {"柳ビル103"}
    telephone_number      {Faker::Number.number(digits: 10)}

    token                 {"tok_abcdefghijk00000000000000000"}
  end
end
