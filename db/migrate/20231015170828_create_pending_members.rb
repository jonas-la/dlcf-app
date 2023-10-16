class CreatePendingMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :pending_members do |t|
      t.string :first_name
      t.string :preferred_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
