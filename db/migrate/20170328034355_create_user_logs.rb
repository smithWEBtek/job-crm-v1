class CreateUserLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :user_logs do |t|
      t.integer :user_id
      t.date :log_date
      t.text :notes

      t.timestamps
    end
  end
end
