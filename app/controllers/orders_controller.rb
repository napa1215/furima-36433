class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      @order_address.save
      redirect_to root_path 
    else
      render :index
    end
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone, :order, :item_id, :user_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
