class Public::OrdersController < ApplicationController
  def new
    # newブランチはここだけ
    @order = Order.new
  end

  def check
    @order = Order.new(order_params)
    @shipping_fee = 800

    if params[:order][:select_address] == "0"
      @order.shipping_postcode = current_customer.postcode
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.name.full_name_nospace

    elsif params[:order][:select_address_registar] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.shipping_postcode = Address.postcode
      @order.shipping_address = Address.address
      @order.shipping_name = Address.name.full_name_nospace

    elsif params[:order][:select_address_new] == "2"
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
