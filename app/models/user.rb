class User < ApplicationRecord
  has_many :bookmarks
  has_many :post_items
  has_many :follows
end
