class Tag < ApplicationRecord
  has_many :tag_maps, dependent: :destroy, foreign_key: 'tag_id'
  has_many :microposts, through: :tag_maps

  validates :tag_name, length: { maximum: 20 }
end
