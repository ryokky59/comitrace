class AddIndexesToFavorites < ActiveRecord::Migration[5.1]
  def change
    add_index :favorites, :user_id
    add_index :favorites, :schedule_id
  end
end
