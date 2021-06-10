class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show]
  before_action :return_item, only: [:edit, :update]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def return_item
    redirect_to root_path if current_user != @item.user
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :category_id, :item_status_id, :fee_status_id,
                                 :item_prefecture_id, :day_id, :price).merge(user_id: current_user.id)
  end
end
