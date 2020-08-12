class SearchesController < ApplicationController
  before_action :search_item, only: [:index, :search]

  def index
    @items = Item.includes(:user).order('created_at DESC')
    @purchases = Purchase.includes(:user).order('created_at DESC')
    set_item_column
  end

  def search
    @results = @p.result.includes(:user)
    @purchases = Purchase.includes(:user).order('created_at DESC')
  end

  private

  def search_item
    @p = Item.ransack(params[:q])  # 検索オブジェクトを生成
  end

  def set_item_column
    @item_name = Item.select("name").distinct  # 重複なくnameカラムのデータを取り出す
   end
end
