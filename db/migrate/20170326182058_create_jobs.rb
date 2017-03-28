class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :url
      t.integer :company_id
      t.text :description
      t.text :requirements
      t.text :instructions

      t.timestamps
    end
  end
end
