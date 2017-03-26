class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
      t.string :name
      t.string :format
      t.string :location
      t.text :description    
      t.integer :user_id

      t.timestamps
    end
  end
end
