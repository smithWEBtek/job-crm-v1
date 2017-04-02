class CreateTodoLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :todo_logs do |t|
      t.integer :todo_id
      t.date :log_date
      t.string :step
      t.text :notes
      t.string :status
      t.string :next_step

      t.timestamps
    end
  end
end
