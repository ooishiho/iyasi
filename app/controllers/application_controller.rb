class ApplicationController < ActionController::Base
  before_action :search

  def search
    @post_items = PostItem.all
  end
end
