class FavoritesController < ApplicationController

  def index
    @favorites = current_user.favorites.includes(:user, :item).order(created_at: :desc)
    @order = Order.new
  end

  def create
    favorite = current_user.favorites.create(item_id: params[:item_id])
    redirect_to item_path(params[:item_id])
  end

  def destroy
    favorite = current_user.favorites.find_by(item_id: params[:item_id]).destroy!
    redirect_to item_path(params[:item_id])
  end


end
