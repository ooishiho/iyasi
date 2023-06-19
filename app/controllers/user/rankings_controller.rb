class User::RankingsController < ApplicationController
  def index
   @point_list = PostItem.joins(:evaluations).
                  group(:post_item_id).order('sum_point DESC').limit(5).sum(:point)
                  
  end
end