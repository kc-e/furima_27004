# frozen_string_literal: true

require 'rails_helper'
RSpec.describe User, type: :model do
  describe '#create' do
    # 1. 正規の入力情報が全て存在すれば登録できること
    it 'is valid with a nickname, email, password, password_confirmation,
        first_name_kanji, last_name_kanji, first_name_kana, last_name_kana, birthday' do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2. nicknameが6文字以下では登録できること
    it 'is valid with a nickname that has less than 6 characters ' do
      user = build(:user, nickname: 'aaaaaa')
      expect(user).to be_valid
    end

    # 3. nicknameが空では登録できないこと
    it 'is invalid without a nickname' do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # 4. nicknameが7文字以上であれば登録できないこと
    it 'is invalid with a nickname that has more than 7 characters ' do
      user = build(:user, nickname: 'aaaaaaa')
      user.valid?
      expect(user.errors[:nickname]).to include('is too long (maximum is 6 characters)')
    end

    # 5. emailが空では登録できないこと
    it 'is invalid without a email address' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # 6. 重複したemailが存在する場合登録できないこと
    it 'is invalid with a duplicate email address' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include('has already been taken')
    end

    # 6.5. emailに@が存在しない場合登録できないこと
    it 'is invalid with a @ mark' do
      user = build(:user, email: 'aaaaaa')
      user.valid?
      expect(user.errors[:email]).to include('is invalid')
    end

    # 7. passwordが空では登録できないこと
    it 'is invalid without a password' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # 8. passwordが存在してもpassword_confirmationが空では登録できないこと
    it 'is invalid without a password_confirmation although with a password' do
      user = build(:user, password_confirmation: '')
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # 9. passwordが6文字以上であれば登録できること
    it 'is valid with a password that has more than 6 characters ' do
      user = build(:user, password: '000000a', password_confirmation: '000000a')
      expect(user).to be_valid
    end

    # 10. passwordに数字が存在していなければ登録できないこと
    it 'is invalid with a number ' do
      user = build(:user, password: 'aaaaaa', password_confirmation: 'aaaaaa')
      user.valid?
      expect(user.errors[:password]).to include
    end

    # 11. passwordに英字が存在していなければ登録できないこと
    it 'is invalid with an English letter ' do
      user = build(:user, password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors[:password]).to include
    end

    # 12. passwordが5文字以下であれば登録できないこと
    it 'is invalid with a password that has less than 5 characters ' do
      user = build(:user, password: '0000a', password_confirmation: '0000a')
      user.valid?
      expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end

    # 13. 本人確認の苗字(漢字)が空では登録できないこと
    it 'is invalid without a first name' do
      user = build(:user, first_name_kanji: nil)
      user.valid?
      expect(user.errors[:first_name_kanji]).to include("can't be blank")
    end

    # 14. 本人確認の苗字(漢字)が全角でなければ登録できないこと
    it 'is invalid with a double-byte' do
      user = build(:user, first_name_kanji: 'aaaaaa')
      user.valid?
      expect(user.errors[:first_name_kanji]).to include('is invalid')
    end

    # 15. 本人確認の名前(漢字)が空では登録できないこと
    it 'is invalid without a last name' do
      user = build(:user, last_name_kanji: nil)
      user.valid?
      expect(user.errors[:last_name_kanji]).to include("can't be blank")
    end

    # 16. 本人確認の名前(漢字)が全角でなければ登録できないこと
    it 'is invalid with a double-byte' do
      user = build(:user, last_name_kanji: 'aaaaaa')
      user.valid?
      expect(user.errors[:last_name_kanji]).to include('is invalid')
    end

    # 17. 本人確認の苗字(カナ)が空では登録できないこと
    it 'is invalid without a first name' do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    # 18. 本人確認の苗字(カナ)が全角カタカナでなければ登録できないこと
    it 'is invalid with a katakana' do
      user = build(:user, last_name_kana: 'aaaaaa')
      user.valid?
      expect(user.errors[:first_name_kana]).to include
    end

    # 19. 本人確認の名前(カナ)が空では登録できないこと
    it 'is invalid without a first name' do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include
    end

    # 20. 本人確認の名前(カナ)が全角カタカナでなければ登録できないこと
    it 'is invalid with a katakana' do
      user = build(:user, last_name_kana: 'aaaaaa')
      user.valid?
      expect(user.errors[:last_name_kana]).to include('is invalid')
    end

    # 21. 生年月日が空では登録できないこと
    it 'is invalid without a birthday' do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end
  end
end
