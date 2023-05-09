class PostItem < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_many :evaluations
end
