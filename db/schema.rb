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

ActiveRecord::Schema.define(version: 2019_06_06_130100) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.boolean "deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sensors", force: :cascade do |t|
    t.string "uuid"
    t.boolean "deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uuid"], name: "index_sensors_on_uuid", unique: true
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "sensor_id"
    t.string "auth_token"
    t.boolean "expired"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sensor_id"], name: "index_sessions_on_sensor_id"
  end

  create_table "shoppinglists", force: :cascade do |t|
    t.bigint "session_id"
    t.bigint "product_id"
    t.boolean "removed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_shoppinglists_on_product_id"
    t.index ["session_id"], name: "index_shoppinglists_on_session_id"
  end

  add_foreign_key "sessions", "sensors"
  add_foreign_key "shoppinglists", "products"
  add_foreign_key "shoppinglists", "sessions"
end
