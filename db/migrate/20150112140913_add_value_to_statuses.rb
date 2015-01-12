class AddValueToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :value, :string
  end
end
