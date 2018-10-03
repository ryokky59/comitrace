class Schedule < ApplicationRecord
  belongs_to :user
  has_many :schedule_plans, dependent: :destroy
  accepts_nested_attributes_for :schedule_plans, allow_destroy: true
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  validates :title, length: { in: 1..30 }
  validates :content, length: { in: 1..300 }
  validate  :precisely_24hour, :injustice_time

  def time_calc
    data = []
    labels = []
    schedule_plans.each do |plan|
      if plan.start_time > plan.end_time
        data << 24 * 60 * 60 - (plan.start_time.to_i - plan.end_time.to_i)
      else
        data << plan.end_time.to_i - plan.start_time.to_i
      end
      labels << plan.plan
    end
    return [data, labels]
  end

  def precisely_24hour
    second = 0
    schedule_plans.each do |plan|
      if plan.start_time > plan.end_time
        second += 24 * 60 * 60 - (plan.start_time.to_i - plan.end_time.to_i)
      else
        second += plan.end_time.to_i - plan.start_time.to_i
      end
    end
    errors.add(:second, ": 時間が24時間ではありません") unless second == 24 * 60 * 60
  end

  def injustice_time
    schedule_plans.each do |plan|
      if plan.start_time == plan.end_time
        time = 15 * 60 * 60
      elsif plan.start_time > plan.end_time
        time = 24 * 60 * 60 - (plan.start_time.to_i - plan.end_time.to_i)
      else
        time = plan.end_time.to_i - plan.start_time.to_i
      end
      errors.add(:time, "#{plan.plan}の時間が不正です") if time >= 15 * 60 * 60
    end
  end
end
