# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do 
    validates :nickname,            uniqueness: { case_sensitive: false }, length: { maximum: 6 }
    validates :birthday

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do 
      validates :first_name_kanji
      validates :last_name_kanji
    end

    with_options format: format: { with: /\A[ァ-ヶー－]+\z/ } do 
      validates :first_name_kana,     
      validates :last_name_kana,      
    end
  end
end
