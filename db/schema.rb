# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170326184515) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "step_id"
    t.integer  "job_id"
    t.integer  "contact_id"
    t.integer  "org_id"
    t.date     "due_date"
    t.text     "notes"
    t.string   "status"
    t.string   "next_step"
    t.boolean  "first_contact"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.integer  "org_id"
    t.string   "fname"
    t.string   "lname"
    t.string   "title"
    t.string   "email"
    t.string   "phone"
    t.string   "url"
    t.text     "about"
    t.text     "history"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "docs", force: :cascade do |t|
    t.string   "file_name"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "org_id"
    t.text     "description"
    t.text     "requirements"
    t.text     "instructions"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "orgs", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.string   "url"
    t.text     "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pdfs", force: :cascade do |t|
    t.string   "file_name"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resources", force: :cascade do |t|
    t.string   "name"
    t.string   "format"
    t.string   "location"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "scrapes", force: :cascade do |t|
    t.string   "file_name"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "steps", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.text     "elevator_pitch"
    t.text     "resume"
    t.text     "twitter_url"
    t.text     "linkedin_url"
    t.text     "github_url"
    t.text     "learn_student_profile_url"
    t.text     "blog_site_url"
    t.text     "portfolio_site_url"
    t.string   "coach_name"
    t.string   "coach_email"
    t.string   "coach_phone"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
