class SchedulePlan < ApplicationRecord
  belongs_to :schedule

  validates :plan, length: { in: 1..10 }
  validates :start_time, presence: true
  validates :end_time, presence: true
end
