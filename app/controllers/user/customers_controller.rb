class User::CustomersController < ApplicationController
  before_action :ensure_normal_user, only: %i[edit update withdraw]

  def show
    if  current_user.email== "guest@example.com"
     flash[:notice] = "ゲストログインではこの機能は利用できません"
     redirect_to user_post_items_path
    end
   @user = User.find(params[:id])
   @post_items = PostItem.all

  end

  def my_page
    if  current_user.email== "guest@example.com"
     flash[:notice] = "ゲストログインではこの機能は利用できません"
     redirect_to user_post_items_path
    end
   @user = current_user
   @post_items = PostItem.all
  end

  def edit
    @post_items = PostItem.all
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
    params.require(:user).permit(:profile_image,:name,:introduction,:email,:password)
  end
end
