class Admin::HomesController < ApplicationController

  before_action :authenticate_admin!

  def top
    @params = params[:id]
    @order = Order.where(customer_id: @params)
    @orders = Order.all

    #@search = Item.ransack(params[:q])
    #@items = @search.result
    #↑検索機能
  end
end
