class User::PostItemsController < ApplicationController
  def index
    @post_item = PostItem.all
  end

  def new
    @post_item = PostItem.new
  end

  def create
    @post_item = PostItem.new(post_item_params)
   @post_item.user = current_user
    @post_item.save!
    redirect_to user_post_item_path(@post_item.id)
  end

  def show
    @post_item = PostItem.find(params[:id])
    @user = current_user
  end

  private
  def post_item_params
     params.require(:post_item).permit(:introduction,:image)
  end
end
