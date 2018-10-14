FactoryBot.define do
  factory :schedule_with_schedule_plan, class: Schedule do
    title "title"
    content "content"
    author_attributes { attributes_for(:schedule_plan[0], :schedule_plan[1])}
  end
end

FactoryBot.define do
  factory :schedule_plan[0] do
    plan "plan"
    start_time "00:00"
    end_time "12:00"
  end
  factory :schedule_plan[1] do
    plan "plan"
    start_time "12:00"
    end_time "00:00"
  end
end
