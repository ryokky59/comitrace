class CreateSchedulePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :schedule_plans do |t|
      t.string :plan, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.integer :schedule_id, null: false

      t.timestamps
    end
  end
end
