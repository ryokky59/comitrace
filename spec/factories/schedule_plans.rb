FactoryBot.define do
  factory :schedule_plan do
    plan { 'plan' }
    start_time { '00:00' }
    end_time { '12:00' }
    schedule
  end
end
