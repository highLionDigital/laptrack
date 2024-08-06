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

ActiveRecord::Schema[7.0].define(version: 2024_08_04_025606) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "circuits", force: :cascade do |t|
    t.string "name"
    t.string "opened"
    t.string "website"
    t.string "address"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.text "bio"
    t.string "country"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_drivers_on_user_id"
  end

  create_table "races", force: :cascade do |t|
    t.bigint "driver_id", null: false
    t.bigint "track_id", null: false
    t.datetime "start_time", null: false
    t.integer "total_laps", null: false
    t.string "avg_lap_time"
    t.string "best_lap_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id", "track_id", "start_time"], name: "index_races_on_driver_id_and_track_id_and_start_time"
    t.index ["driver_id"], name: "index_races_on_driver_id"
    t.index ["track_id"], name: "index_races_on_track_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.bigint "circuit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circuit_id"], name: "index_tracks_on_circuit_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "auth0_id"
  end

  add_foreign_key "drivers", "users"
  add_foreign_key "races", "drivers"
  add_foreign_key "races", "tracks"
  add_foreign_key "tracks", "circuits"
end
