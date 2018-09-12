class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
