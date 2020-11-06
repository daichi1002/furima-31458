FactoryBot.define do
  factory :item do
    name            { Faker::Lorem.sentence }
    description     { Faker::Lorem.sentence }
    category_id     { 1 }
    status_id       { 1 }
    ship_method_id  { 1 }
    consignor_id    { 1 }
    days_to_ship_id { 1 }
    amount_sold     { 10000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
