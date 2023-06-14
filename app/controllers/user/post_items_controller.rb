class User::PostItemsController < ApplicationController
  def index
    if params[:all] == "true"
       @post_items =  PostItem.all
    elsif params[:all] == "false"
       @post_items =  current_user.post_items
    else
       @post_items =  PostItem.page(params[:page]).per(8)
    end
    if params["search"].present?
      @post_items = PostItem.search(params["search"])
    end
     @user = current_user
  end

  def new
    @post_item = PostItem.new
  end

  def create
    @post_item = PostItem.new(post_item_params)
    @post_item.user = current_user
    @post_item.save
    redirect_to user_post_item_path(@post_item.id)
  end

  def show
    @post_items = PostItem.all
    @post_item = PostItem.find(params[:id])
    @user = @post_item.user
    @login_user = current_user
    @evaluation = Evaluation.new()
  end

  def search
    @post_items = PostItem.search(params[:keyword])
    @user = current_user
  end

  private
  def post_item_params
     params.require(:post_item).permit(:comment,:image)
  end
end
