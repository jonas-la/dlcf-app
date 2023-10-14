class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :location
      t.datetime :start_time
      t.datetime :end_time
      t.string :description
      t.timestamps
    end
  end
end
