class OrdersController < ApplicationController
  before_action :move_to_session, only: [:index]
  before_action :move_to_index, only: [:index]
  before_action :set_item, only: %i[index create]

  def index
    @order = OrderAddress.new
  end

  def new
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to new_card_path(current_user)
    else
      @item = Item.find(params[:item_id])
      @order = CardAddress.new
    end
  end

  def create
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      @order = OrderAddress.new(credit_params)
      if @order.valid?
        pay_item
        @order.save
        redirect_to root_path
      else
        render :index
      end
    else
      @order = CardAddress.new(address_params)
      if @order.valid?
        credit_pay
        @order.save
        redirect_to root_path
      else
        render :new
      end
    end
  end

  def show
    @orders = current_user.orders.includes(:user, :item).order(created_at: :desc)
  end

  private

  def move_to_session
    redirect_to user_session_path unless user_signed_in?
  end

  def move_to_index
    item = Item.find(params[:item_id])
    order = Order.new
    redirect_to root_path if current_user.id == item.user_id || item.order != order.item_id
  end

  def credit_params
    params.permit(:post_number, :prefecture_id, :city_name, :house_number, :building_name, :phone_number, :token, :item_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: credit_params[:token],
      currency: 'jpy'
    )
  end

  def credit_pay
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer_token = current_user.card.customer_token
    Payjp::Charge.create(
      amount: @item.price,
      customer: customer_token,
      currency: 'jpy'
    )
  end

  def address_params
    params.permit(:post_number, :prefecture_id, :city_name, :house_number, :building_name, :phone_number, :item_id).merge(user_id: current_user.id)
  end
end
