class ProjectsEvents < ActiveRecord::Migration
  def change
    create_table :projects_events, :id => false do |t|
      t.integer :project_id
      t.integer :event_id
    end
  end
end
