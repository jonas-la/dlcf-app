class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :preferred_name
      t.string :last_name
      t.string :email
      t.boolean :is_member
      t.boolean :is_admin
      t.text :bio
      t.string :contact
      t.string :photo_file_name
      t.string :role

      t.timestamps
    end
  end
end
