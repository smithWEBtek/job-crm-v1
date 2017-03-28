class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :url
      t.text :about

      t.timestamps
    end
  end
end
