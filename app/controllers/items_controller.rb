class ItemsController < ApplicationController
  before_action :authenticate_user!, only: %i[new]
  before_action :set_item, only: %i[show edit update destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
    @purchases = Purchase.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
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

  def set_item
    @item = Item.find(params[:id])
  end
end
