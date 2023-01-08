FactoryBot.define do
  factory :order_delivery do
    postal_code     { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    prefecture_id   { Faker::Number.between(from: 1, to: 47) }
    address1        { Faker::Address.city }
    address2        { Faker::Address.street_address }
    building        { Faker::Address.street_address }
    phone_number    { Faker::Number.decimal_part(digits: 11) }
    token           { 'abc1234567890qwertyu'}
  end
end