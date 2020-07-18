class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase

  # 画像は1枚必須であること
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_pattern
  belongs_to_active_hash :consignor_area
  belongs_to_active_hash :delivery_day

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :image, :name, :explanation, :price,
              :category, :condition, :delivery_pattern,
              :consignor_area, :delivery_day, :user_id
  end

  # 選択が「--」のままになっていないか
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_pattern_id
    validates :consignor_area_id
    validates :delivery_day_id
  end

  # 価格の範囲が、¥300~¥9,999,999の間であること
  with_options numericality: {
    only_integer: true,
    greater_than: 300,
    less_than: 9_999_999
  } do
    validates :price
  end
end
