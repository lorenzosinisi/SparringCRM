class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :state
      t.string :value
      t.string :name
      t.string :note
      t.string :assigned_to
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
