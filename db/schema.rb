# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_12_07_052410) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "office_id", null: false
    t.datetime "booked_time"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dentist_id"
    t.index ["client_id"], name: "index_bookings_on_client_id"
    t.index ["dentist_id"], name: "index_bookings_on_dentist_id"
    t.index ["office_id"], name: "index_bookings_on_office_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "medical_history"
    t.string "insurance_provider"
    t.string "insurance_number"
    t.text "dental_concerns"
    t.string "password"
  end

  create_table "dentists", force: :cascade do |t|
    t.string "name"
    t.string "expertise"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offices", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "clients"
  add_foreign_key "bookings", "dentists"
  add_foreign_key "bookings", "offices"
end
