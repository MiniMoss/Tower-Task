class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_type
      t.datetime :event_time
      t.string :event_creator
      t.string :event_topic

      t.timestamps null: false
    end
  end
end
