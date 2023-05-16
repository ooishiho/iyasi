class User::CustomersController < ApplicationController
  def show
    @usre = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_my_page_path
  end

  def unsubscribe
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to new_user_session_path
  end

  private

  def user_params
    params.require(:user).permit(:name,:email)
  end
end
