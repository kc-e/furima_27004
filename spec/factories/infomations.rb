FactoryBot.define do
  factory :infomation do
    postcode                  { '123-4567' }
    prefecture_id             { '15' }
    city                      { '横浜市緑区' }
    street                    { '青山1-1-1' }
    building_name             { '' }
    phone_number              { '09012345678' }
  end
end
