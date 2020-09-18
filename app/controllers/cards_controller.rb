class CardsController < ApplicationController
  def new
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer = Payjp::Customer.create(
      description: 'test',
      card: params[:token]
    )

    if params[:token].blank?
      redirect_to new_card_path
    else
      card = Card.new(
      card_token: params[:token],
      customer_token: customer.id, 
      user_id: current_user.id 
      )
      card.save
      redirect_to root_path
    end

  end


end
