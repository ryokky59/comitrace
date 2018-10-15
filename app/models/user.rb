class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :profile, length: { maximum: 200 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :schedule, optional: true
  has_many :schedules, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :favorite_schedules, through: :favorites, source: :schedule
  has_many :active_follows, -> { order(created_at: :desc) }, foreign_key: 'follower_id', class_name: 'Follow', dependent: :destroy
  has_many :passive_follows, -> { order(created_at: :desc) }, foreign_key: 'followed_id', class_name: 'Follow', dependent: :destroy
  has_many :following, through: :active_follows, source: :followed
  has_many :followers, through: :passive_follows, source: :follower

  mount_uploader :icon, IconUploader

  def follow(other_user)
    following << other_user
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def unfollow(other_user)
    active_follows.find_by(followed_id: other_user.id).destroy
  end
end
