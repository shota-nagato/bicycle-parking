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

ActiveRecord::Schema[7.1].define(version: 2023_12_29_042415) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bicycle_parkings", force: :cascade do |t|
    t.string "name", null: false
    t.string "location", null: false
    t.string "opening_hours", null: false
    t.integer "bicycle_capacity", default: 0, null: false
    t.integer "motorized_bicycle_under_50cc_capacity", default: 0, null: false
    t.integer "motorized_bicycle_under_125cc_capacity", default: 0, null: false
    t.integer "bicycle_and_motorized_bicycle_under_50cc_capacity", default: 0, null: false
    t.integer "motorcycle_capacity", default: 0, null: false
    t.string "motorcycle_price", null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.boolean "published", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location"], name: "index_bicycle_parkings_on_location", unique: true
    t.index ["name"], name: "index_bicycle_parkings_on_name", unique: true
  end

end
