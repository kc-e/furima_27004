# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,            presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 6 }
  validates :first_name_kanji,    presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name_kanji,     presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana,     presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kana,      presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday,            presence: true
end
