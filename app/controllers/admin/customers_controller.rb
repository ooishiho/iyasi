class Admin::CustomersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(10)
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_customer_path(@user.id)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:email,:is_deleted)
  end
end
