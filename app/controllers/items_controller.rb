class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.order('created_at DESC')
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :image,
      :name,
      :explanation,
      :price,
      :category_id,
      :condition_id,
      :delivery_pattern_id,
      :consignor_area_id,
      :delivery_day_id
    ).merge(user_id: current_user.id)
  end
end

