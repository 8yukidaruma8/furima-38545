class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :sold_out_check, only: [:index, :create]

  def index
    @purchases_address = PurchasesAddress.new
  end

  def create
    @purchases_address = PurchasesAddress.new(purchase_params)
    if @purchases_address.valid?
      pay_item
      @purchases_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchases_address).permit(:post_code, :prefectures_id, :municipalitie, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.selling_price, 
      card: purchase_params[:token],
      currency:'jpy')
  end

  def sold_out_check
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || !@item.purchase.nil?
      redirect_to root_path
    end
  end
end
