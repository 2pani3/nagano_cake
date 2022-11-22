class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    # @customer = Customer.find(params[:id])
    @customer = current_customer
  if@customer.update(customer_params)
    flash[:notice] = "更新が完了しました！"
    redirect_to customer_path(@customer.id)
  end
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
