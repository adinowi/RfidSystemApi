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

ActiveRecord::Schema.define(version: 2019_06_21_175906) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jwt_blacklists", force: :cascade do |t|
    t.string "jti", null: false
    t.index ["jti"], name: "index_jwt_blacklists_on_jti"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.boolean "deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sensors", force: :cascade do |t|
    t.boolean "deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shoppinglists", force: :cascade do |t|
    t.bigint "shoppingsession_id"
    t.bigint "tag_id"
    t.boolean "removed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shoppingsession_id"], name: "index_shoppinglists_on_shoppingsession_id"
    t.index ["tag_id"], name: "index_shoppinglists_on_tag_id"
  end

  create_table "shoppingsessions", force: :cascade do |t|
    t.bigint "sensor_id"
    t.bigint "user_id"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sensor_id"], name: "index_shoppingsessions_on_sensor_id"
    t.index ["user_id"], name: "index_shoppingsessions_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.bigint "product_id"
    t.string "uuid"
    t.boolean "paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_tags_on_product_id"
    t.index ["uuid"], name: "index_tags_on_uuid", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "shoppinglists", "shoppingsessions"
  add_foreign_key "shoppinglists", "tags"
  add_foreign_key "shoppingsessions", "sensors"
  add_foreign_key "shoppingsessions", "users"
  add_foreign_key "tags", "products"
end
