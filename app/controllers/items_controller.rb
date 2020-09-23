class ItemsController < ApplicationController
  before_action :find_params, only: %i[show edit update destroy]
  before_action :sold_out, only: %i[index show search]

  def index
    @items = Item.includes(:user, :order).order(created_at: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user).order(created_at: :desc)
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    @items = Item.search(params[:keyword]).order(created_at: :desc)
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :price, :category_id, :status_id, :delivery_fee_id, :delivery_when_id, :delivery_where_id, images: []).merge(user_id: current_user.id)
  end

  def find_params
    @item = Item.find(params[:id])
  end

  def sold_out
    @order = Order.new
  end
end
