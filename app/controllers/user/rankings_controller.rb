class User::RankingsController < ApplicationController
  def index
    if  current_user.email== "guest@example.com"
     flash[:notice] = "ゲストログインではこの機能は利用できません"
     redirect_to user_post_items_path
    end

   @point_list = PostItem.joins(:evaluations).
                  group(:post_item_id).order('sum_point DESC').limit(5).sum(:point)

    @total = PostItem.joins(:evaluations).group(:post_item_id).sum(:point)
  end
end