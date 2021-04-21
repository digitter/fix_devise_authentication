class CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
  end

  def edit
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
        rediirect_to customer_params
    else
        render :edit
    end
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
  
end
