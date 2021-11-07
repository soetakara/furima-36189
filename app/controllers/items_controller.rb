class ItemsController < ApplicationController
  before_action :sign_in_check, only: [:new]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
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

end
