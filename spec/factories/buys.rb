FactoryBot.define do
  factory :buy do
    postalcode     { '123-4567' }
    state_id       { 1 }
    city           { '宮崎県' }
    address_number { ' 1-1' }
    building_name  { '宮崎ハイツ' }
    phone_number   { '09012345678' }
  end
end
