class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: :index
  before_action :move_to_index, only: [:index, :create]

  def index
    redirect_to root_path if current_user.id == @item.user_id
    @buy = Buy.new
  end

  def create
    @buy = Buy.new(purchase_params)
    if @buy.valid?
      pay_item
      @buy.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:buy).permit(:postalcode, :state_id, :city, :address_number, :phone_number, :purchase_id).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.amount_sold,
      card:  purchase_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if @item.purchase != nil
      redirect_to root_path
    end
  end
end
