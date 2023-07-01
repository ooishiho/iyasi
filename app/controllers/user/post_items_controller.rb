class User::PostItemsController < ApplicationController
  before_action :ensure_normal_user, only: %i[new create update destroy]

  def index
    if  current_user.email== "guest@example.com"
      @post_items = PostItem.page(params[:page]).per(8)
    end

    if params[:all] == "true"
       @post_items =  PostItem.all
    elsif params[:all] == "false"
       @post_items =  current_user.post_items
    else
      @post_items = @post_items.where(user_id: params[:user_id])
    end
     @user = current_user
     @post_items =  @post_items.page(params[:page]).per(8)
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
    @total = PostItem.joins(:evaluations).group(:post_item_id).where(id: @post_item.id).sum(:point)[@post_item.id]
  end

  def search
    @post_items = PostItem.search_keyword(params[:search])
    @user = current_user
  end

  private
  def post_item_params
     params.require(:post_item).permit(:comment,:image)
  end

  def user_params
    params.require(:user).permit(:name,:email,:introduction)
  end
end
