class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :schedules, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_schedules, through: :favorites, source: :schedule
  has_many :active_follows, foreign_key: 'follower_id', class_name: 'follow', dependent: :destroy
  has_many :passive_follows, foreign_key: 'followed_id', class_name: 'follow', dependent: :destroy
  has_many :following, through: :active_follows, source: :followed
  has_many :followers, through: :passive_follows, source: :follower
end
