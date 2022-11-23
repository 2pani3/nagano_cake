class Admin::OrdersController < ApplicationController
    
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
     if @order.update(order_params)
      if @order.status == "確認"
       @order_details.update_all(making_status: :b)
      end
       redirect_to admin_order_path(@order)
     end
  end

  
  private
  
  def order_params
     params.require(:order).permit(:customer_id, :shipping_cost, :total_payment, :order_status)
  end
  

end
