class Admin::PostItemsController < ApplicationController
  def index
    @post_items = PostItem.all
    if params[:user_id].present?
      @post_items = @post_items.where(user_id: params[:user_id])
    end
    @post_items = @post_items.page(params[:page]).per(8)
  end

  def destroy
    @post_item = PostItem.find(params[:id])
    @post_item.destroy
    redirect_to admin_post_items_path,notice: "投稿が削除されました。"
  end

  def show
    @login_user = current_user
    @evaluation = Evaluation.new()
    @post_item = PostItem.find(params[:id])
    @user = User.find(params[:id])
     @total = PostItem.joins(:evaluations).group(:post_item_id).where(id: @post_item.id).sum(:point)[@post_item.id]
  end

  private

  def post_item_params
    params.require(:post_item).permit(:introduction,:image)
  end

  def user_params
    params.require(:user).permit(:name,:email)
  end
end
