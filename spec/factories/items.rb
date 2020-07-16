FactoryBot.define do
  # belongs_to :user
  factory :item, aliases: [:item_id] do
    after(:build) do |item|
      item.image = Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'files', 'test_image.jpg'), 'image/jpg')
    end
    name                    { 'りんご' }
    explanation             { '赤いです。' }
    price                   { 1000 }
    category_id             { 2 }
    condition_id            { 2 }
    delivery_pattern_id     { 2 }
    consignor_area_id       { 2 }
    delivery_day_id         { 2 }
    # user                    { create(:user) }
    association :user
  end
end
