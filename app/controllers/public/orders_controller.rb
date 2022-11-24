class Public::OrdersController < ApplicationController
  def new
    # newブランチはここだけ
    @order = Order.new
  end

  def check
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    @shipping_fee = 800
    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price += cart_item.item.tax_price*cart_item.amount
    end

    if params[:order][:select_address] == "0"
      @order.shipping_postcode = current_customer.postcode
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.full_name_nospace

    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.shipping_postcode = @address.postcode
      @order.shipping_address = @address.address
      @order.shipping_name = @address.name

    elsif params[:order][:select_address] == "2"
      # 住所入力を選んだのに空白だと進めないようにする 実装できず...
      unless params[:order][:select_address] == " "
        @order.shipping_postcode = params[:order][:shipping_postcode]
        @order.shipping_address = params[:order][:shipping_address]
        @order.shipping_name = params[:order][:shipping_name]
      else
        flash[:notice] ="フォームに情報を入力してください"
        render :new
      end
    else
      render :new
    end

  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end

private
  def order_params
    params.require(:order).permit(:shipping_postcode, :shipping_address, :shipping_name, :payment_way, :total_payment, :status, :shipping_fee)
  end
end
