require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe "Schedule" do
    context "scheduleが正常に生成される" do
      it "is valid with a title, content, plan, start_time and end_time" do
        schedule = build(:schedule_with_schedule_plan).attributes
        expect(schedule).to be_valid
      end
    end
  end
end
