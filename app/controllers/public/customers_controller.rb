class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @customer = current_customer
  end

  def edit
  end

  def update
  end

  def quit
  end

  def withdrawal
  end
  
private  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email)
  end
end
