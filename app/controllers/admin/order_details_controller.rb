class Admin::OrderDetailsController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end

  def update
    #@order = Order.find_by(params[:order_detail][:order_id])
    @order_detail = OrderDetail.find(params[:id])
    @order_details = OrderDetail.all

    #is_updated = true
    @order_detail.update(order_details_params)
    if @order_detail.making_status == "making"

      @order_detail.order.update(status: 2)

    elsif OrderDetail.where(order_id: @order_detail.order_id,making_status: 3).count == OrderDetail.where(order_id: @order_detail.order_id).count
       @order_detail.order.update(status: 3)

    end

   redirect_to admin_order_path(@order_detail.order.id)
  end

  private

  def order_details_params
    params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
  end

end
