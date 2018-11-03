class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i(google)

  belongs_to :schedule, optional: true
  has_many :schedules, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :favorite_schedules, through: :favorites, source: :schedule
  has_many :active_follows, -> { order(created_at: :desc) }, foreign_key: 'follower_id', class_name: 'Follow', dependent: :destroy #follower_idにある自分のidを全て取得 active=「フォローした側」
  has_many :passive_follows, -> { order(created_at: :desc) }, foreign_key: 'followed_id', class_name: 'Follow', dependent: :destroy #followed_idにある自分のidを全て取得 passive=「フォローされた側」
  has_many :following, through: :active_follows, source: :followed
  has_many :followers, through: :passive_follows, source: :follower

  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :profile, length: { maximum: 200 }

  mount_uploader :icon, IconUploader

  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)
    user = User.new(email: auth.info.email, provider: auth.provider, uid: auth.uid, password: Devise.friendly_token[0, 20]) unless user
    user.save
    user
  end

  def self.create_unique_string
    SecureRandom.uuid
  end

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
