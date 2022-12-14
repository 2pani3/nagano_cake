class Admin::CustomersController < ApplicationController

  before_action :authenticate_admin!

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

    @customer = Customer.find(params[:id])
     if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
     else
      render edit_admin_customer_path(@customer)
     end


    #@search = Item.ransack(params[:q])
    #@items = @search.result
    #↑検索機能
  end
   private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :phone_number, :address, :is_deleted)
  end
end
