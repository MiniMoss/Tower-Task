class CreateAccesses < ActiveRecord::Migration
  def change
    create_table :accesses do |t|
      t.string :role
      t.integer :user_id
      t.integer :team_id

      t.timestamps null: false
    end
  end
end
