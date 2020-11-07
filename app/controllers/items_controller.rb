class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.order('created_at DESC')
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless  user_signed_in?
      redirect_to new_user_session_path
      return
    end
    if current_user.id != @item.user_id
      redirect_to root_path
    end 
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to root_path
    end 
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :ship_method_id, :consignor_id, :days_to_ship_id, :amount_sold).merge(user_id: current_user.id)
  end
end
