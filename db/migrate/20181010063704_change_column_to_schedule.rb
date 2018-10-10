class ChangeColumnToSchedule < ActiveRecord::Migration[5.1]
  def up
    change_column :schedules, :title, :string, limit: 30
  end

  def down
    change_column :schedules, :title, :string
  end
end
