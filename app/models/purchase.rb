class Purchase < ApplicationRecord
  # has_one :imfomation
  belongs_to :user
  belongs_to :item
end
