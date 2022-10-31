class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show]
  before_action :correct_item,only: [:edit]

  def index
    @items = Item.all.order("created_at DESC")
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
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :image, :genre_id, :commodity_condition_id, :shipping_charge_id,:prefecture_id, :days_to_ship_id, :selling_price, :explanation, :purchase).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def correct_item
      @item = Item.find(params[:id])
    unless @item.user.id == current_user.id
      redirect_to items_path
    end
  end
end
