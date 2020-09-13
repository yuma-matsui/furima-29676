class OrdersController < ApplicationController
  before_action :move_to_session, only: [:index]
  before_action :move_to_index, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(credit_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  def move_to_session
    unless user_signed_in? 
      redirect_to user_session_path
    end
  end
  
  def move_to_index
    item = Item.find(params[:item_id])
    order = Order.new
    if current_user.id == item.user_id || item.order != order.item_id
      redirect_to root_path
    end
  end

  def credit_params
    params.permit(:post_number, :prefecture_id, :city_name, :house_number, :building_name, :phone_number, :token, :item_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
    
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: credit_params[:token],
      currency: 'jpy'
    )
  end

end

 
