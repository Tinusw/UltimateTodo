class CreateTodoLists < ActiveRecord::Migration[5.0]
  def change
    create_table :todo_lists do |t|
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
