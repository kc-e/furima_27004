require 'rails_helper'

RSpec.describe Infomation, type: :model do
  describe '#create' do
    before do
      @infomation = build(:infomation)
    end

    # 1. 郵便番号が必須であること
    it 'is invalid without a postcode' do
      @infomation.postcode = nil
      @infomation.valid?
      expect(@infomation.errors[:postcode]).to include("can't be blank")
    end

    # 2. 郵便番号にハイフン（-）は必要であること
    it 'is invalid without a -' do
      @infomation.postcode = 1_234_567
      @infomation.valid?
      expect(@infomation.errors[:postcode]).to include('is not a number')
    end

    # 3. 都道府県についての情報が必須であること
    it 'is invalid without a prefecture_id' do
      @infomation.prefecture_id = nil
      @infomation.valid?
      expect(@infomation.errors[:prefecture_id]).to include("can't be blank")
    end

    # 4. 市区町村についての情報が必須であること
    it 'is invalid without a city' do
      @infomation.city = nil
      @infomation.valid?
      expect(@infomation.errors[:city]).to include("can't be blank")
    end

    # 5. 番地についての情報が必須であること
    it 'is invalid without a street' do
      @infomation.street = nil
      @infomation.valid?
      expect(@infomation.errors[:street]).to include("can't be blank")
    end

    # 6. 電話番号についての情報が必須であること
    it 'is invalid without a phone_number' do
      @infomation.phone_number = nil
      @infomation.valid?
      expect(@infomation.errors[:phone_number]).to include("can't be blank")
    end

    # 7. 電話番号にハイフン（-）は不要であること
    it 'is invalid without a -' do
      @infomation.phone_number = '090-1234-5678'
      @infomation.valid?
      expect(@infomation.errors[:phone_number]).to include('is not a number')
    end
  end
end
