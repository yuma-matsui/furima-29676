FactoryBot.define do
  factory :comment do
    content {Faker::Lorem.sentences}
    association :user
    association :item
  end
end
