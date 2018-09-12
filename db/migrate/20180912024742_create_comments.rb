class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :comment, null: false
      t.integer :schedule_id, null: false

      t.timestamps
    end
  end
end
