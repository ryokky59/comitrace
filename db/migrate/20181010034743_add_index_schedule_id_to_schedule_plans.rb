class AddIndexScheduleIdToSchedulePlans < ActiveRecord::Migration[5.1]
  def change
    add_index :schedule_plans, :schedule_id
  end
end
