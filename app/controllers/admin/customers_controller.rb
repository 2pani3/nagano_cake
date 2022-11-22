class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all

    #@search = Item.ransack(params[:q])
    #@items = @search.result
    #↑検索機能
  end

  def show
    @customer = Customer.find(params[:id])

    #@search = Item.ransack(params[:q])
    #@items = @search.result
    #↑検索機能
  end

  def edit
    @customer = Customer.find(params[:id])

    #@search = Item.ransack(params[:q])
    #@items = @search.result
    #↑検索機能
  end

  def update
    @genres = Genre.all
    @customer = Customer.find(params[:id])
    @customerorders = Order.where(customer_id: @customer.id)
    redirect_to admin_customer_path(@customer.id)
    
    #@search = Item.ransack(params[:q])
    #@items = @search.result
    #↑検索機能
  end
   private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :phone_number, :address, :is_deleted)
  end
end
