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

  def save_tag(sent_tags)
    # current_tag: 既に登録されているタグ
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    # old_tag: current_tagと、sent_tagの重複しているタグ
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.post_tags.delete PostTag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      new_post_tag = PostTag.find_or_create_by(tag_name: new)
      self.post_tags << new_post_tag
    end
  end
end
