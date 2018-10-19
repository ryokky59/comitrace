FactoryBot.define do
  factory :schedule, class: Schedule do
    title "title"
    content "content"
  end
end

FactoryBot.define do
  factory :schedule_plan do
    id "1"
    plan "plan"
    start_time "00:00"
    end_time "12:00"
  end
end
