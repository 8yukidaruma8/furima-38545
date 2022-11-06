FactoryBot.define do
  factory :purchases_address do
    post_code            {'012-3456'}
    prefectures_id       {2}
    municipalitie        {'test'}
    address              {'testtest'}
    building_name        {''}
    phone_number         {'09012345678'}
    token                {"tok_abcdefghijk00000000000000000"}
    association :user
    association :item
  end
end