class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookmarks,dependent: :destroy
  has_many :post_items,dependent: :destroy

  has_many :relationships, class_name: "Follow", foreign_key: "follow_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy

  has_many :followings, through: :relationships, source: :follower
  has_many :follows, through: :reverse_of_relationships, source: :follow
  
  def follow(user_id)
    Follow.create(follower_id: user_id,follow_id:self.id)
  end
  
  def unfollow(user_id)
    Follow.find_by(follower_id: user_id,follow_id:self.id).destroy
  end
  
  def following?(user)
    Follow.where(follower_id: user.id,follow_id:self.id).present?
  end
end
