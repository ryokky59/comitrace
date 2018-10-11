class RemoveIndexFollowerIdToFollowss < ActiveRecord::Migration[5.1]
  def change
    remove_index :follows, :follower_id
  end
end
