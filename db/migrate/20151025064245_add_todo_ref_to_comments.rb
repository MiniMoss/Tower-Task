class AddTodoRefToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :todo, index: true, foreign_key: true
  end
end
