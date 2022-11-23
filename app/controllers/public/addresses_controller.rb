class Public::AddressesController < ApplicationController
  def index
    @customer = current_customer
  end

  def create
    
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  def customer_params
    params.require(:customer).permit(:postcode, :address, :phone_number)
  end
end
