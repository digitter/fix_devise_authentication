class CustomersController < ApplicationController
before_action :authenticate_customer!

  def show
    @customer = current_customer
  end


  def edit
    @customer = current_customer
  end


  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customers_my_page_path(current_customer.id)
  end


  def unsubscribe
    @customer = current_customer
  end


  def withdraw
    @customer = current_customer
    @customer.update(is_customer_status: true)
    reset_session
    flash[:notice] = "退会しました"
    redirect_to root_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email)
  end

end

