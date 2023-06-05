class User::RankingsController < ApplicationController
  def index
   @point_list = PostItem.joins(:evaluations).
                  group(:post_item_id).order('sum_point DESC').sum(:point)

  # @post_items = PostItem.
  #  left_joins(:comments).
  #  distinct.
  #  sort_by do |post_item|
  #  hoges = post_item.comments
  #   if hoges.present?
  #      hoges.map(&:score).sum
  #   else
  #      0
  #   end
  #  end.
  #  reverse
  end
end