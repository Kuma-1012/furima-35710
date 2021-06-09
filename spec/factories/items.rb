FactoryBot.define do
  factory :item do
    item_name { 'test' }
    item_info { 'test' }
    category_id { 2 }
    item_status_id { 2 }
    fee_status_id { 2 }
    item_prefecture_id { 2 }
    day_id { 2 }
    price { 1000 }

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/furima-footer.png'), filename: 'furima-footer.png')
    end
    association :user
  end
end
