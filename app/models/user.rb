class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookmarks,dependent: :destroy
  has_many :post_items,dependent: :destroy

  has_many :follows, class_name: "Relationship", foreign_key: "follow_id", dependent: :destroy
  has_many :followings, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy

  has_many :followings, through: :follows, source: :follower
  has_many :follows, through: :follows, source: :follow
  
  def follow(user_id)
    follows.create(follower_id: user_id)
  end
  
  def unfollow(user_id)
    follows.find_by(follower_id: user_id).destroy
  end
  
  def following?(user)
    follows.include?(user)
  end
end
