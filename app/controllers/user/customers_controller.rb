class User::CustomersController < ApplicationController
  def show
    @usre = current_customer
  end

  def edit
    @user = current_customer
  end

  def update
    @user = current_customer
    @user.update(customer_params)
    redirect_to user_my_page_path
  end

  def unsubscribe
  end

  def withdraw
    @user = current_customer
    @user.update(is_deleted: true)
    reset_session
    redirect_to new_user_session_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:email)
  end
end
