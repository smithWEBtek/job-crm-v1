class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.integer :org_id
      t.string :fname
      t.string :lname
      t.string :title
      t.string :email
      t.string :phone
      t.string :url
      t.text :about
      t.text :history

      t.timestamps
    end
  end
end
