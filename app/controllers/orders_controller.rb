class OrdersController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!
  before_action :sign_in_seller_check
  before_action :sign_in_not_seller_check

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def sign_in_seller_check
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def sign_in_not_seller_check
    unless @item.order.nil?
      redirect_to root_path
    end
  end

  def order_address_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_address_params[:token],
      currency: 'jpy' 
    )
  end
end
