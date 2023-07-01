class User::FollowsController < ApplicationController
 before_action :ensure_normal_user, only: %i[following followers create destroy]

  def index
    @users = current_user.followings
    @follow = current_user.follows
    if  current_user.email== "guest@example.com"
     flash[:notice] = "ゲストログインではこの機能は利用できません"
     redirect_to user_post_items_path
    end
  end

  def following
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

  def create
    current_user.follow(params[:id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:id])
    redirect_to request.referer
  end
end
