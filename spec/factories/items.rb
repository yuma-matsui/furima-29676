FactoryBot.define do
  factory :item do
    name              {Faker::Name.name}
    content           {Faker::Lorem.sentences}
    category_id       {Faker::Number.between(from: 2, to: 11)}
    status_id         {Faker::Number.between(from: 2, to: 7)}
    delivery_fee_id   {Faker::Number.between(from: 2, to: 3)}
    delivery_when_id  {Faker::Number.between(from: 2, to: 4)}
    delivery_where_id {Faker::Number.between(from: 2, to: 7)}
    price             {Faker::Number.within(range: 300..9_999_999)}
    association :user

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/staff2.jpg'), filename: 'staff2.jpg')
    end
  end
end
