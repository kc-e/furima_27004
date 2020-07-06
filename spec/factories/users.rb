# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    nickname              { 'ジロウ' }
    email                 { 'kkk@gmail.com' }
    password              { '00000000a' }
    password_confirmation { '00000000a' }
    first_name_kanji      { '田中' }
    last_name_kanji       { '次郎' }
    first_name_kana       { 'タナカ' }
    last_name_kana        { 'ジロウ' }
    birthday              { '2000-10-10' }
  end
end
