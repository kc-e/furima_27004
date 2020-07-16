class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])

    redirect_to root_path if @item.user_id == current_user.id || Purchase.exists?(item_id: @item.id)
  end

  def create
    @item = Item.find(params[:item_id])
    pay_item

    @purchase = UserPurchase.new(purchase_params)

    return redirect_to root_path if @purchase.save

    render 'index'
  end

  private

  def purchase_params
    params.permit(
      :number, :exp_month, :exp_year, :cvc,
      :postcode, :prefecture_id, :city, :street, :building_name, :phone_number,
      :item_id
    ).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,     # 商品の値段
      card: params[:token],    # トークン
      currency: 'jpy'
    )
  end
end
