class AddStatusIdToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :status_id, :int
  end
end
