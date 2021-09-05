class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end     
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == @item.user_id
    if @item.update(item_params)
      redirect_to root_path(@item)
    else
      render :edit
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:image, :title, :text, :genre_id, :condition_id, :delivery_fee_id, :prefecture_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end
end
