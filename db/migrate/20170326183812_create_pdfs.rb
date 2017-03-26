class CreatePdfs < ActiveRecord::Migration[5.0]
  def change
    create_table :pdfs do |t|
      t.string :file_name
      t.string :location
      t.integer :resource_id

      t.timestamps
    end
  end
end
