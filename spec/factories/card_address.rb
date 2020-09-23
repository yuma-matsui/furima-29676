FactoryBot.define do
  factory :card_address do
    post_number { '111-1111' }
    prefecture_id { 2 }
    city_name { '東京' }
    house_number { '世田谷区' }
    building_name { 'セタガヤハイツ' }
    phone_number { '00000000000' }
  end
end
