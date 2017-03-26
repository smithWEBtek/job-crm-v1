class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :phone1
      t.string :phone2
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :state
      t.string :zip

      t.text   :elevator_pitch
      t.text   :resume
      t.text   :twitter_url
      t.text   :linkedin_url
      t.text   :github_url
      t.text   :learn_student_profile_url
      t.text   :blog_site_url
      t.text   :portfolio_site_url

      t.string :coach_name
      t.string :coach_email
      t.string :coach_phone

      t.timestamps
    end
  end
end
