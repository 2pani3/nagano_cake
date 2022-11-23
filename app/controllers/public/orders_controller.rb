class Public::OrdersController < ApplicationController
  def new
    # newブランチはここだけ
    @order = Order.new
  end

  def check
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    @total 
    @shipping_fee = 800

    if params[:order][:select_address] == "0"
      @order.shipping_postcode = current_customer.postcode
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.name.full_name_nospace

    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.shipping_postcode = Address.postcode
      @order.shipping_address = Address.address
      @order.shipping_name = Address.name.full_name_nospace

    elsif params[:order][:select_address] == "2"
      @order.shipping_postcode = params[:order][:shipping_postcode]
      @order.shipping_address = params[:order][:shipping_address]
      @order.shipping_name = params[:order][:shipping_name]
      @order.save

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
    params.require(:order).permit(:name, :address, :postcode)
  end
end
