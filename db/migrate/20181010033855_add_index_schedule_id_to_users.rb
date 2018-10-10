class AddIndexScheduleIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :schedule_id
    add_index :users, :name, unique: true
  end
end
