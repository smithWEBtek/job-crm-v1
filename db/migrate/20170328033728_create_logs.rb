class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.integer :todo_id
      t.text :note
    
      t.timestamps
    end
  end
end
