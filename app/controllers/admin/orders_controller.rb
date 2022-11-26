class Admin::OrdersController < ApplicationController
    
  def show
    @order = Order.find(params[:id])
    @order_details= @order.order_details


  end
  
  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
     if @order.update(order_params)
      @order_details.update_all(making_status: 1) if @order.status == "check"
      
     end
       redirect_to admin_order_path(@order)
     
  end

  
  private
  
  def order_params
     params.require(:order).permit(:shipping_postcode, :shipping_address, :shipping_name, :payment_way, :total_payment, :status, :shipping_fee )
  end
  

end
