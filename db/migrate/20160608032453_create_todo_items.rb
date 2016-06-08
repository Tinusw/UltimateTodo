class CreateTodoItems < ActiveRecord::Migration[5.0]
  def change
    create_table :todo_items do |t|
      t.string :desc, null: false
      t.integer :priority
      t.date :due_date
      t.boolean :completed, null: false, default: false
      t.references :todo_list, foreign_key: true

      t.timestamps
    end
  end
end
