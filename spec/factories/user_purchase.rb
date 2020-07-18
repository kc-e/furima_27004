FactoryBot.define do
  factory :user_purchase do
    number                    { '4242424242424242' }
    exp_month                 { '12' }
    exp_year                  { '24' }
    cvc                       { '123' }
    postcode                  { '123-4567' }
    prefecture_id             { 15 }
    city                      { '横浜市緑区' }
    street                    { '青山1-1-1' }
    building_name             { 'トンチンカン' }
    phone_number              { '09012345678' }

    association :user_id
    association :item_id
  end
end
