class OrdersController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    binding.pry
    @order = Order.new(order_params)
    if @order.valid?
      # pay_item
      @order.save
      Address.create(address_params)
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def order_params
    params.require(:order).permit().merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def address_params
    params.require(:order).permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :telephone_number).merge(order_id: @order.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_7fe5f160d1873c77b83696a8"
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy' 
    )
  end
end
