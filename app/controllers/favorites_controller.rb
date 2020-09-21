class FavoritesController < ApplicationController

  def create
    favorite = Favorite.new(favorite_params)
    favorite.save
    redirect_to root_path
  end

  private

  def favorite_params
    params.permit(:checked).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
