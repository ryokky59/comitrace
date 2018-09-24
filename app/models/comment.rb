class Comment < ApplicationRecord
  belongs_to :schedule
  belongs_to :user

  validates :comment, length: { in: 1..50 }
end
