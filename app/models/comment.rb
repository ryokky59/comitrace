class Comment < ApplicationRecord
  belongs_to :schedule
  belongs_to :user

  validates :comment, presence: true, length: { in: 1..50 }
end
