class User < ApplicationRecord
  has_many :microposts, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true
  validates :email,    presence: true

end
