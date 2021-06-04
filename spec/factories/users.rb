FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.free_email }
    password { 'test1234' }
    password_confirmation { password }
    last_name { '鈴木' }
    first_name { '太郎' }
    last_name_katakana { 'スズキ' }
    first_name_katakana { 'タロウ' }
    birthday { Faker::Date.backward }
  end
end
