class PostItem < ApplicationRecord
  belongs_to :user
  has_many :bookmarks,dependent: :destroy
  has_many :evaluations,dependent: :destroy

  has_many :bookmarking_users, through: :bookmarks, source: :user

  has_one_attached :image

  validates :image, presence: true

  def self.search_keyword(word)
    if word != ""
      PostItem.joins(:user).where(['comment LIKE(?) OR users.name LIKE (?)', "%#{word}%", "%#{word}%"])
    else
      PostItem.includes(:user).order('created_at DESC')
    end
  end

  def get_item_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image_square.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    image.variant(resize_to_limit: [width,height]).processed
  end

  def favorited_by?(user)
    bookmarks.where(user:user).exists?
  end

end
