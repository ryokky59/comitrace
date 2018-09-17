class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :schedule_id, :integer
  end
end
