class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :content, :price, :category_id, :status_id, :delivery_fee_id, :delivery_when_id, :delivery_where_id, :image).merge(user_id: current_user.id)
  end

end
