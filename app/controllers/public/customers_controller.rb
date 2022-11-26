class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
  if@customer.update(customer_params)
    flash[:notice] = "更新が完了しました！"
     redirect_to customers_path(@customer.id)
  end
  end

  def quit
    
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: "退会処理を実行しました"
  end

private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email)
  end
end
