FactoryBot.define do
  factory :item do
    image                  {Faker::Lorem.sentence}
    item_name              {'hoge'}
    explanation            {'test'}
    genre_id               {2}
    commodity_condition_id {2}
    shipping_charge_id     {2}
    prefecture_id          {2}
    days_to_ship_id        {2}
    selling_price          {'10000'}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end

