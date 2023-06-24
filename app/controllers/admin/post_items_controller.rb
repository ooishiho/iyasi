class Admin::PostItemsController < ApplicationController
  def index

    @post_items = PostItem.page(params[:page]).per(8)
  end

  def destroy
    @post_item = PostItem.find(params[:id])
    @post_item.destroy
    redirect_to admin_post_items_path,notice: "投稿が削除されました。"
  end

  def show
    @post_item = PostItem.find(params[:id])
    @user = User.find(params[:id])
    @total = PostItem.joins(:evaluations).group(:post_item_id).sum(:point)
  end

  private

  def post_item_params
    params.require(:post_item).permit(:introduction,:image)
  end

  def user_params
    params.require(:user).permit(:name,:email,:password)
  end
end
