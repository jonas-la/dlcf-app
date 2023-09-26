class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.integer :satisfaction
      t.string :critiques
      t.string :new_ideas
      t.references :member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
