class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.integer :company_id, default: 1
      t.string :fname
      t.string :lname
      t.string :title
      t.string :email
      t.string :phone
			t.string :url
			t.string :linkedin
			t.string :twitter
      t.text :about

      t.timestamps
    end
  end
end
