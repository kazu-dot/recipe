class Micropost < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  validates :user_id, presence: true
  validates :title  , presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 140 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
