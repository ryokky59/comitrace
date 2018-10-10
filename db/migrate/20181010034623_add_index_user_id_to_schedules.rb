class AddIndexUserIdToSchedules < ActiveRecord::Migration[5.1]
  def change
    add_index :schedules, :user_id
  end
end
