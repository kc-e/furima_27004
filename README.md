# FURIMA DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
|kanji_name|string|null: false|
|kana_name|string|null: false|
|birthday|integer|null: false|
### Association
- has_many :products
- has_many :purchases
- has_many :infomations

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text||
|product_name|text||
|product_explanation|text||
|product_category|text||
|product_condition|text||
|delivery_pattern|text||
|consignor_area|text||
|delivery_days|text||
|price|integer||
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :purchase
- belongs_to :infomation

## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product
- belongs_to :infomation

## infomationsテーブル
|Column|Type|Options|
|------|----|-------|
|postcode|text||
|municipality|text||
|street|text||
|building_name|text||
|phone_number|integer||
### Association
- belongs_to :user
- belongs_to :product
- belongs_to :purchase
