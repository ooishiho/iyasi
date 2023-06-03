class User::FollowsController < ApplicationController

  def index
    @users = user.followings
    @users = user.followers
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
