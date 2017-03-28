class CreateActions < ActiveRecord::Migration[5.0]
  def change
    create_table :actions do |t|
      t.integer :user_id
      t.integer :step_id, default: 1
      t.integer :job_id, default: 1
      t.integer :contact_id, default: 1
      t.integer :company_id, default: 1
      t.date :date
      t.text :notes
      t.string :status
      t.string :next_step
      t.boolean :first_contact

      t.timestamps
    end
  end
end
