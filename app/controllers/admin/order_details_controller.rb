class Admin::OrderDetailsController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    @order_detail.update(order_details_params)

    if @order_details.where(making_status: "製作中").count >= 1
      @order.order_status = "製作中"
      @order.save
    end

   if @order.order_details.count == @order_details.where(making_status: "製作完了").count
      @order.order_status = "発送準備中"
      @order.save
   end
    redirect_to admin_order_path(@order_detail.order.id)
  end
  private

  def order_details_params
    params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
  end

end
