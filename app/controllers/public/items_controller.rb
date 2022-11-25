class Public::ItemsController < ApplicationController
  def index
    @items_all = Item.all
    @genres = Genre.all
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.page(params[:page])
    else
      @items = Item.page(params[:page])
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private
 def item_params
  params.require(:item).permit(:name,:item_image,:price)
 end

 def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
 end

end

