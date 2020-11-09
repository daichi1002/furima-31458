class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: :index

  def index
    redirect_to root_path if current_user.id == @item.user_id
    @buy = Buy.new
  end

  def create
    @buy = Buy.new(purchase_params)
    if @buy.valid?
      @buy.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:buy).permit(:postalcode, :state_id, :city, :address_number, :phone_number, :purchase_id).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
