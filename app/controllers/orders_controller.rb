class OrdersController < ApplicationController
  before_action :move_to_session
  before_action :move_to_index

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end
  
  private
  def move_to_session
    unless user_signed_in? 
      redirect_to user_session_path
    end
  end
  
  def move_to_index
    item = Item.find(params[:item_id])
    if current_user.id == item.user_id
      redirect_to root_path
    end
  end


end
