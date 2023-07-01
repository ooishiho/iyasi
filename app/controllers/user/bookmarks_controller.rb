class User::BookmarksController < ApplicationController
  def index
    @bookmarks = current_user.bookmarks
    if  current_user.email== "guest@example.com"
     flash[:notice] = "ゲストログインではこの機能は利用できません"
     redirect_to user_post_items_path
    end
  end

  def create
    post_item = PostItem.find(params[:post_item_id])
    favorite = current_user.bookmarks.new(post_item_id: post_item.id)
    favorite.save
    redirect_to user_post_item_path(post_item)
  end

  def destroy
    post_item = PostItem.find(params[:post_item_id])
    favorite = current_user.bookmarks.find_by(post_item_id: post_item.id)
    favorite.destroy
    redirect_to user_post_item_path(post_item)
  end

end
