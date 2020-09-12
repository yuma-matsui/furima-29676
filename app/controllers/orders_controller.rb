class OrdersController < ApplicationController
  before_action :move_to_session
  before_action :move_to_index

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end
  @address = Address.new

  def create
    @order = Order.new(credit_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end
    # @order = OrderAddress.new(address_params)
    # @order.save
    # if @order.valid?
    #   pay_item
    #   @order.save
    #   return redirect_to root_path
    # else
    #   render :index
    # end
  
  
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

  def credit_params
    params.permit(:token, :item_id).merge(user_id: current_user.id)
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
  # def address_params
  #   params.require(:order_address).permit(:post_number, :prefecture_id, :city_name, :house_number, :building_number, :phone_number)
  # end
  # def order_params
  #   params.permit(:token)
  # end

  


