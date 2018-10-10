class ChangeColumnToSchedulePlan < ActiveRecord::Migration[5.1]
  def up
    change_column :schedule_plans, :plan, :string, limit: 10
  end

  def down
    change_column :schedule_plans, :plan, :string
  end
end
