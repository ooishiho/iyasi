class User::RankingsController < ApplicationController
  def index
  @users = User.
   left_joins(:comments).
   distinct.
   sort_by do |user|
   hoges = user.comments
    if hoges.present?
       hoges.map(&:score).sum
    else
       0
    end
   end.
   reverse
  end
end