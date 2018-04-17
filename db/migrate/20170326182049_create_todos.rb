class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.integer :user_id
      t.integer :step_id, default: 1
      t.integer :job_id, default: 1
      t.integer :contact_id, default: 1
      t.integer :company_id, default: 1
      t.date :due_date
      t.text :description
      t.integer :priority, default: 1

      t.timestamps
    end
  end
end
