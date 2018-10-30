FactoryBot.define do
  factory :schedule do
    title { 'title' }
    content { 'content' }
    user
    after(:create) do |schedule|
      schedule.schedule_plans << FactoryBot.attributes_for(:schedule_plan, plan: 'ひとつめのプラン', start_time: '00:00', end_time: '12:00')
      schedule.schedule_plans << FactoryBot.attributes_for(:schedule_plan, plan: 'ふたつめのプラン', start_time: '12:00', end_time: '00:00')
    end
  end
end
