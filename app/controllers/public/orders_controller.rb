class Public::OrdersController < ApplicationController
  def new
    # newブランチはここだけ
    @order = Order.new
  end

  def check
    @order = Order.new(order_params)
    
    if params[:order][:address_option] == "0"
      @order.
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
