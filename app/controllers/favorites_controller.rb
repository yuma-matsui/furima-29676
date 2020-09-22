class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.build(item_id: params[:item_id])
    favorite.save!
    redirect_to item_path(params[:item_id])
  end

  def destroy
    current_user.favorites.find_by(item_id: params[:item_id]).destroy!
    redirect_to item_path(params[:item_id])
  end

end
