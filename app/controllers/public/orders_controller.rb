class Public::OrdersController < ApplicationController
  def new
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
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all
    if @order.save
      @cart_items.each do |cart|
        @order_detail = OrderDetail.new #order_detailにデータを移す
        @order_detail.item_id = cart.item_id
        @order_detail.order_id = @order.id
        @order_detail.amount = cart.amount
        @order_detail.price = cart.item.tax_price
        @order_detail.save #order_detailに保存
      end
      current_customer.cart_items.destroy_all
      redirect_to complete_path
    else
      @order = Order.new(order_params)
      render :new
    end

  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
    @orders = Order.page(params[:page])
  end

  def show
    @order =Order.find(params[:id])
    @orders = @order.order_details
  end

private
  def order_params
    params.require(:order).permit(:shipping_postcode, :shipping_address, :shipping_name, :payment_way, :total_payment, :status, :shipping_fee)
  end
end
