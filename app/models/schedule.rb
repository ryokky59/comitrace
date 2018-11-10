class Schedule < ApplicationRecord
  belongs_to :user
  has_many :users, dependent: :nullify
  has_many :schedule_plans, dependent: :destroy
  accepts_nested_attributes_for :schedule_plans, allow_destroy: true
  has_many :comments, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :favorites, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  scope :recent, -> { order(created_at: :desc) }

  validates :title, length: { in: 1..30 }
  validates :content, length: { in: 1..300 }
  validate  :schedule_plans_blank, :injustice_time, :precisely_24hour

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
    return data, labels
  end

  private

  def schedule_plans_blank
    schedule_plans.each_with_index do |schedule_plan, i|
      errors.add(:plan, "の#{i+1}番目を入力してください") if schedule_plan.plan.blank?
      errors.add(:start_time, "の#{i+1}番目を入力してください") if schedule_plan.start_time.blank?
      errors.add(:end_time, "の#{i+1}番目を入力してください") if schedule_plan.end_time.blank?
    end
  end

  def injustice_time
    schedule_plans.each do |schedule_plan|
      next if schedule_plan.start_time.blank? || schedule_plan.end_time.blank?
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
    total_time = 0
    schedule_plans.each do |schedule_plan|
      break if schedule_plan.start_time.blank? || schedule_plan.end_time.blank?
      if schedule_plan.start_time > schedule_plan.end_time # 00:00を跨いだら
        total_time += 24 * 60 * 60 - (schedule_plan.start_time.to_i - schedule_plan.end_time.to_i)
      else
        total_time += schedule_plan.end_time.to_i - schedule_plan.start_time.to_i
      end
    end
    errors[:base] << "時間が24時間分ではありません" unless total_time == 24 * 60 * 60
  end
end
