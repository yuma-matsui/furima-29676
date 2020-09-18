class UsersController < ApplicationController
  before_action :user_find, only: [:edit, :update]

  def update
    if @user.update(user_params)
      sign_in(@user, bypass: true)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_date, :password)
  end

  def user_find
    @user = User.find(params[:id])
  end

end
