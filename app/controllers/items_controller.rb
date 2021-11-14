class ItemsController < ApplicationController
  before_action :sign_in_check, only: [:new]
  before_action :preset_item, only: [:show]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def sign_in_check
    if user_signed_in?
    else
      redirect_to new_user_session_path
    end
  end

  def item_params
    params.require(:item).permit(:title, :category_id, :status_id, :fee_id, :prefecture_id, :shipping_date_id, :price, :explantion, :image).merge(user_id: current_user.id)
  end
  def preset_item
    @item = Item.find(params[:id])
  end

end
