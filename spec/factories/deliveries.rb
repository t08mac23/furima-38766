FactoryBot.define do
  factory :delivery do
    # user_id         { Faker::Number.non_zero_digit }
    # item_id         { Faker::Number.non_zero_digit }
    postal_code     { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    prefecture_id   { Faker::Number.between(from: 1, to: 47) }
    address1        { Faker::Address.city }
    address2        { Faker::Address.street_address }
    building        { Faker::Address.street_address }
    phone_number    { Faker::Number.decimal_part(digits: 11) }
    token           { 'abc1234567890qwertyu'}
    # association :order
  end
end
