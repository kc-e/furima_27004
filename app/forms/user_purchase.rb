class UserPurchase
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :street, :building_name, :phone_number, :user_id, :item_id,
                :number, :exp_month, :exp_year, :cvc

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :postcode, :prefecture_id, :city, :street,
              :phone_number
  end

  # 郵便番号にはハイフン（-）が必要
  with_options format: { with: /\A\d{3}[-]\d{4}\z/ } do
    validates :postcode
  end

  # 電話番号にはハイフン（-）が不要
  with_options format: { with: /\A\d{10,11}\z/ } do
    validates :phone_number
  end

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :number, :exp_month, :exp_year, :cvc, :user_id, :item_id
  end

  # クレジットカードの情報が正しくないと決済できない
  # with_options format: { with: /\A(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6011[0-9]{12}|3(?:0[0-5]|[68][0-9])[0-9]{11}|3[47][0-9]{13})\z/ } do
  #   validates :number
  # end

  def save
    purchases = Purchase.create(user_id: user_id, item_id: item_id) # オーバーライド
    infomations = Infomation.create(
      postcode: postcode,
      prefecture_id: prefecture_id,
      city: city,
      street: street,
      building_name: building_name,
      phone_number: phone_number,
      user_id: user_id
    )
    # card = Card.create()
    if purchases.persisted? && infomations.persisted?
      true
    else
      false
    end
  end
end
