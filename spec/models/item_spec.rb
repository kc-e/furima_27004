require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = build(:item)
    end

    # 1. 正規の入力情報が全て存在すれば登録できること
    it 'is valid with a name, explanation, price, category_id,
        condition_id, delivery_pattern_id, consignor_area_id,
        delivery_day_id, user_id' do
      expect(@item).to be_valid
    end

    # 2. 画像は1枚必須であること(ActiveStorageを使用すること)
    it 'is invalid without a image' do
      @item.image = nil
      @item.valid?
      expect(@item.errors[:image]).to include("can't be blank")
    end

    # 3. 商品名が必須であること
    it 'is invalid without a name' do
      @item.name = nil
      @item.valid?
      expect(@item.errors[:name]).to include("can't be blank")
    end

    # 4. 商品の説明が必須であること
    it 'is invalid without a explanation' do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors[:explanation]).to include("can't be blank")
    end

    # 5. カテゴリーの情報が必須であること
    it 'is invalid without a category_id' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors[:category_id]).to include('is not a number')
    end

    # 6. 商品の状態についての情報が必須であること
    it 'is invalid without a condition_id' do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors[:condition_id]).to include('is not a number')
    end

    # 7. 配送料の負担についての情報が必須であること
    it 'is invalid without a delivery_pattern_id' do
      @item.delivery_pattern_id = nil
      @item.valid?
      expect(@item.errors[:delivery_pattern_id]).to include('is not a number')
    end

    # 8. 発送元の地域についての情報が必須であること
    it 'is invalid without a consignor_area_id' do
      @item.consignor_area_id = nil
      @item.valid?
      expect(@item.errors[:consignor_area_id]).to include('is not a number')
    end

    # 9. 発送までの日数についての情報が必須であること
    it 'is invalid without a delivery_day_id' do
      @item.delivery_day_id = nil
      @item.valid?
      expect(@item.errors[:delivery_day_id]).to include('is not a number')
    end

    # 10. 価格についての情報が必須であること
    it 'is invalid without a price' do
      @item.price = nil
      @item.valid?
      expect(@item.errors[:price]).to include("can't be blank")
    end

    # 11. 価格が、¥300未満の場合、出品できないこと
    it 'is invalid with a price less than 300' do
      @item.price = 200
      @item.valid?
      expect(@item.errors[:price]).to include('must be greater than 300')
    end

    # 12. 価格が、¥¥9,999,999より高い場合、出品できないこと
    it 'is invalid with a price higher than 9,999,999' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors[:price]).to include('must be less than 9999999')
    end
  end
end
