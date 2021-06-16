FactoryBot.define do
  factory :purchase_user_address do
    postal_code { '333-1111' }
    prefecture_id { 2 }
    city { '横浜市緑区' }
    address { '青山1-1-1' }
    building { '柳ビル103' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
