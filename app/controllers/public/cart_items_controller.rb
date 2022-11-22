class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price += cart_item.item.tax_price*cart_item.amount
    end
  end

  def create
    cart_item=CartItem.new(cart_item_params)
    cart_item.customer_id=current_customer.id
    cart_item.save
    flash[:notice] ="商品をカートに追加しました"
    redirect_to cart_items_path
  end

  def update
    cart_item=CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    flash[:notice] ="個数を変更しました"
    redirect_to cart_items_path(cart_item.id)

  end

  def destroy
    cart_item=CartItem.find(params[:id])
    cart_item.destroy
    flash[:notice] ="商品をカートから削除しました"
    redirect_to cart_items_path
  end

  def all_destroy
    @cart_items=current_customer.cart_items.all
    @cart_items.destroy_all
    flash[:notice] ="カートが空になりました"
    redirect_to cart_items_path
  end

private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
