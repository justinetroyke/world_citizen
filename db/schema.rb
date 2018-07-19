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

ActiveRecord::Schema.define(version: 2018_07_19_023927) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string "business_name"
    t.string "name"
    t.string "donation_amount"
    t.string "organization"
    t.string "category"
    t.integer "stamp"
    t.string "organization_location"
    t.bigint "stamp_id"
    t.index ["stamp_id"], name: "index_items_on_stamp_id"
  end

  create_table "passport_stamps", force: :cascade do |t|
    t.bigint "passport_id"
    t.bigint "stamp_id"
    t.index ["passport_id"], name: "index_passport_stamps_on_passport_id"
    t.index ["stamp_id"], name: "index_passport_stamps_on_stamp_id"
  end

  create_table "passports", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_passports_on_user_id"
  end

  create_table "stamps", force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "passport_id"
    t.index ["passport_id"], name: "index_users_on_passport_id"
  end

  add_foreign_key "items", "stamps"
  add_foreign_key "passport_stamps", "passports"
  add_foreign_key "passport_stamps", "stamps"
  add_foreign_key "passports", "users"
  add_foreign_key "users", "passports"
end
