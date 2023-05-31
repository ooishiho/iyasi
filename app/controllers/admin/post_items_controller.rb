class Admin::PostItemsController < ApplicationController
  def index
    @post_items = PostItem.page(params[:page]).per(8)
  end

  def destroy
  end

  def show
    @post_item = PostItem.find(params[:id])
    @user = User.find(params[:id])
  end

  private

  def post_item_params
    params.require(:post_item).permit(:introduction,:image)
  end

  def user_params
    params.require(:user).permit(:name,:email,:password)
  end
end
