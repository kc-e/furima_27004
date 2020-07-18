require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe '#create' do
    before do
      @purchase = build(:purchase)
    end

    # 1. 正規の入力情報が全て存在すれば登録できること
    it 'is valid with a number. exp_month, exp_year, cvc, postcode, prefecture_id, city, street, building_name, phone_number' do
      expect(@purchase).to be_valid
    end

    # 2. カード番号が必須であること
    it 'is invalid without a number' do
      @purchase.number = nil
      @purchase.valid?
      expect(@purchase.errors[:number]).to include("can't be blank")
    end

    # 3. 有効期限（月）が必須であること
    it 'is invalid without a exp_month' do
      @purchase.exp_month = nil
      @purchase.valid?
      expect(@purchase.errors[:exp_month]).to include("can't be blank")
    end

    # 4. 有効期限（年）が必須であること
    it 'is invalid without a exp_year' do
      @purchase.exp_year = nil
      @purchase.valid?
      expect(@purchase.errors[:exp_year]).to include("can't be blank")
    end

    # 5. セキュリティコードが必須であること
    it 'is invalid without a cvc' do
      @purchase.cvc = nil
      @purchase.valid?
      expect(@purchase.errors[:cvc]).to include("can't be blank")
    end

    # 6. 郵便番号が必須であること
    it 'is invalid without a postcode' do
      @purchase.postcode = nil
      @purchase.valid?
      expect(@purchase.errors[:postcode]).to include("can't be blank")
    end

    # 7. 郵便番号にハイフン（-）は必要であること
    it 'is invalid without a -' do
      @purchase.postcode = '1234567'
      @purchase.valid?
      expect(@purchase.errors[:postcode]).to include('is not a number')
    end

    # 8. 都道府県についての情報が必須であること
    it 'is invalid without a prefecture_id' do
      @purchase.prefecture_id = nil
      @purchase.valid?
      expect(@purchase.errors[:prefecture_id]).to include("can't be blank")
    end

    # 9. 市区町村についての情報が必須であること
    it 'is invalid without a city' do
      @purchase.city = nil
      @purchase.valid?
      expect(@purchase.errors[:city]).to include("can't be blank")
    end

    # 10. 番地についての情報が必須であること
    it 'is invalid without a street' do
      @purchase.street = nil
      @purchase.valid?
      expect(@purchase.errors[:street]).to include("can't be blank")
    end

    # 11. 電話番号についての情報が必須であること
    it 'is invalid without a phone_number' do
      @purchase.phone_number = nil
      @purchase.valid?
      expect(@purchase.errors[:phone_number]).to include("can't be blank")
    end

    # 12. 電話番号にハイフン（-）は不要であること
    it 'is invalid without a -' do
      @purchase.phone_number = '090-1234-5678'
      @purchase.valid?
      expect(@purchase.errors[:phone_number]).to include('is not a number')
    end
  end
end
