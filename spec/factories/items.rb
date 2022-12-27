FactoryBot.define do
  factory :item do
    image          {Faker::Lorem.sentence}
    item_name      {Faker::Lorem.sentence}
    description    {Faker::Lorem.sentence}
    category_id         {Faker::Number.between(from: 2, to: 11)}
    condition_id        {Faker::Number.between(from: 2, to: 7)}
    delivery_charge_id  {Faker::Number.between(from: 2, to: 3)}
    prefecture_id       {Faker::Number.between(from: 1, to: 47)}
    delivery_date_id    {Faker::Number.between(from: 2, to: 4)}
    price               {Faker::Number.between(from: 300, to: 9999999)}
    association :user
  end
end
