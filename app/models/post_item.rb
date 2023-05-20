class PostItem < ApplicationRecord
  belongs_to :user
  has_many :bookmarks,dependent: :destroy
  has_many :evaluations

  has_one_attached :image

  def self.search(search)
    if search != ""
      PostItem.where(['introduction LIKE(?)', "%#{search}%"])
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
    bookmarks.exists?(user_id: user.id)
  end

end
