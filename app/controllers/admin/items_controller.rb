class Admin::ItemsController < ApplicationController
  
    before_action :authenticate_admin!
  
  def index
    @items = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "商品が登録されました。"
      redirect_to admin_items_path(@item)
    else
      flash[:notice] = "商品の登録内容に不備があります。"
      render "new"
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "商品内容が変更されました。"
      redirect_to admin_item_path(@item)
    else
      flash[:notice] = "商品の内容変更に不備があります。"
      render "edit"
    end
  end


  private
  def item_params
    params.require(:item).permit(:item_image, :name, :description, :genre_id, :price, :is_active )
  end


end