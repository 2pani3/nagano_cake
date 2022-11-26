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

    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present? #すでに入っている同じ商品はあるか？
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i #cart_itemパラムの数量を足す
      cart_item.save
      flash[:notice] ="商品をカートに追加しました"
      redirect_to cart_items_path
    else #同じ商品がないならそのまま保存
      cart_item.save
      redirect_to cart_items_path
    end

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
