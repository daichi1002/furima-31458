FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '田中' }
    last_name             { '太郎' }
    first_name_reading    { 'タナカ' }
    last_name_reading     { 'タロウ' }
    birth_day             { Faker::Date.birthday }
  end
end
