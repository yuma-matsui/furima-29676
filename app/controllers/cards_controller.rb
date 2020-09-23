class CardsController < ApplicationController
  def new
    card = Card.where(user_id: current_user.id).first
    redirect_to user_path(current_user) unless card.blank?
  end

  def show
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    @credit = Card.find_by(user_id: current_user.id)
    if @credit.blank?
      redirect_to action: 'new'
    else
      customer = Payjp::Customer.retrieve(@credit.customer_token)
      @card = customer.cards.first
    end
  end

  def create
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
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

  def destroy
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer = Payjp::Customer.retrieve(card.customer_token)
    if customer.delete
      card.delete
      redirect_to root_path
    else
      redirect_to action: 'show'
    end
  end
end
