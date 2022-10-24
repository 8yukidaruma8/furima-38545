FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'佐藤'}
    first_name            {'太郎'}
    last_name_kana        {'サトウ'}
    first_name_kana       {'タロウ'}
    birth_date            {'2000.4.1'}
  end
end
