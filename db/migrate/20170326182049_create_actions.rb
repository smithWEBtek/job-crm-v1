class CreateActions < ActiveRecord::Migration[5.0]
  def change
    create_table :actions do |t|
      t.integer :user_id
      t.integer :step_id
      t.integer :job_id
      t.integer :contact_id
      t.integer :org_id
      t.date :due_date
      t.text :notes
      t.string :status
      t.string :next_step
      t.boolean :first_contact

      t.timestamps
    end
  end
end
