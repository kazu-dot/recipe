class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  has_many :favorites, dependent: :destroy


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true



  # 現在のユーザーがフォローしてたらtrueを返す
  def favorite?(micropost)
    favorites.include?(micropost)
  end
end

