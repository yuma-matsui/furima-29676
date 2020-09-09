FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.first_name}
    email                 {Faker::Internet.email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    first_name            {'田中'}
    last_name             {'太郎'}
    first_name_kana       {'タナカ'}
    last_name_kana        {'タロウ'}
    birth_date            {Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}
  end
end
