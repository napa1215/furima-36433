class OrdersController < ApplicationController
  before_action :find_item, only: [:index, :create]
  before_action :sold_out_item, only: [:index]
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
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
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token] )
  end

  private

   def find_item
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path
    end
   end

    def sold_out_item
      redirect_to root_path if @item.order.present?
    end
end

