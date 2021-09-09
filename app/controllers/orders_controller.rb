class OrdersController < ApplicationController
  before_action :find_item, only: [:index, :create]
  before_action :sold_out_item, only: [:index]

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      Payjp.api_key = "sk_test_f14b99a45fcc248075ef8734"
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'                 
      )
      @order_address.save
      redirect_to root_path 
    else
      render :index
    end

  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone,  :item_id, :user_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token] )
  end

  private

   def find_item
    @item = Item.find(params[:item_id])
   end

   def sold_out_item
    redirect_to root_path if @item.order.present?
   end
end

