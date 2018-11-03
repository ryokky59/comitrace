FactoryBot.define do
  factory :schedule do
    title { 'title' }
    content { 'content' }
    user
    after(:create) do |schedule|
      schedule.schedule_plans << create(:schedule_plan, plan: '1つめのプラン', start_time: '00:00:00', end_time: '12:00:00', schedule: schedule)
      schedule.schedule_plans << create(:schedule_plan, plan: '2つめのプラン', start_time: '12:00:00', end_time: '00:00:00', schedule: schedule)
    end
  end
end
