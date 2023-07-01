class ApplicationController < ActionController::Base
  before_action :search
  
  def ensure_normal_user
     if current_user.email== "guest@example.com"
       redirect_to user_post_items_path, alert: 'ゲストユーザーの更新・削除はできません。'
     end
  end

  def search
    @post_items = PostItem.all
  end
end
