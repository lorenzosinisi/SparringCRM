class AddUserIdToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :user_id, :int
  end
end
