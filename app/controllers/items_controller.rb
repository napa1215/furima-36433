class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :user_match, only: [:edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path(@item)

  end

  private
  
  def item_params
    params.require(:item).permit(:image, :title, :text, :genre_id, :condition_id, :delivery_fee_id, :prefecture_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def user_match
    redirect_to root_path unless current_user.id == @item.user_id
  end 
end
