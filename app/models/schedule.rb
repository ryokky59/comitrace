class Schedule < ApplicationRecord
  belongs_to :user
  has_many :schedule_plans, dependent: :destroy
  accepts_nested_attributes_for :schedule_plans, allow_destroy: true
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  validates :title, length: { in: 1..30 }
  validates :content, length: { in: 1..300 }
  validate  :schedule_plans_nil, :injustice_time, :precisely_24hour


  def time_calc
    data = []
    labels = []
    schedule_plans.each do |schedule_plan|
      if schedule_plan.start_time > schedule_plan.end_time
        data << 24 * 60 * 60 - (schedule_plan.start_time.to_i - schedule_plan.end_time.to_i)
      else
        data << schedule_plan.end_time.to_i - schedule_plan.start_time.to_i
      end
      labels << schedule_plan.plan
    end
    return [data, labels]
  end

  def schedule_plans_nil
    count = 0
    schedule_plans.each do |schedule_plan|
      count += 1
      errors.add(:plan, "の#{count}番目を入力してください") if schedule_plan.plan.empty?
      errors.add(:start_time, "の#{count}番目を入力してください") if schedule_plan.start_time.nil?
      errors.add(:end_time, "の#{count}番目を入力してください") if schedule_plan.end_time.nil?
    end
  end

  def injustice_time
    schedule_plans.each do |schedule_plan|
      next if schedule_plan.plan.empty? || schedule_plan.start_time.nil? || schedule_plan.end_time.nil?
      if schedule_plan.start_time == schedule_plan.end_time
        time = 15 * 60 * 60
      elsif schedule_plan.start_time > schedule_plan.end_time
        time = 24 * 60 * 60 - (schedule_plan.start_time.to_i - schedule_plan.end_time.to_i)
      else
        time = schedule_plan.end_time.to_i - schedule_plan.start_time.to_i
      end
      errors[:base] << "#{schedule_plan.plan}の時間が不正です" if time >= 15 * 60 * 60
    end
  end

  def precisely_24hour
    twentyfour = 0
    schedule_plans.each do |schedule_plan|
      next if schedule_plan.start_time.nil? || schedule_plan.end_time.nil?
      if schedule_plan.start_time > schedule_plan.end_time
        twentyfour += 24 * 60 * 60 - (schedule_plan.start_time.to_i - schedule_plan.end_time.to_i)
      else
        twentyfour += schedule_plan.end_time.to_i - schedule_plan.start_time.to_i
      end
    end
    errors[:base] << "時間が24時間分ではありません" unless twentyfour == 24 * 60 * 60
  end
end
