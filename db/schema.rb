# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170114153038) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drink_items", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "menu_id"
    t.string   "food_image_file_name"
    t.string   "food_image_content_type"
    t.integer  "food_image_file_size"
    t.datetime "food_image_updated_at"
  end

  add_index "drink_items", ["menu_id"], name: "index_drink_items_on_menu_id", using: :btree

  create_table "first_course_items", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "menu_id"
    t.string   "food_image_file_name"
    t.string   "food_image_content_type"
    t.integer  "food_image_file_size"
    t.datetime "food_image_updated_at"
  end

  add_index "first_course_items", ["menu_id"], name: "index_first_course_items_on_menu_id", using: :btree

  create_table "main_course_items", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "menu_id"
    t.string   "food_image_file_name"
    t.string   "food_image_content_type"
    t.integer  "food_image_file_size"
    t.datetime "food_image_updated_at"
  end

  add_index "main_course_items", ["menu_id"], name: "index_main_course_items_on_menu_id", using: :btree

  create_table "menu_lists", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.string   "course_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "menu_id"
  end

  add_index "menu_lists", ["menu_id"], name: "index_menu_lists_on_menu_id", using: :btree

  create_table "menus", force: :cascade do |t|
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.text     "first_course", default: [],              array: true
    t.text     "main_course",  default: [],              array: true
    t.text     "drink",        default: [],              array: true
    t.string   "who_order"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_orders", force: :cascade do |t|
    t.datetime "date"
    t.string   "order_owner"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "first_course_item_id"
    t.integer  "main_course_item_id"
    t.integer  "drink_item_id"
  end

  add_index "user_orders", ["drink_item_id"], name: "index_user_orders_on_drink_item_id", using: :btree
  add_index "user_orders", ["first_course_item_id"], name: "index_user_orders_on_first_course_item_id", using: :btree
  add_index "user_orders", ["main_course_item_id"], name: "index_user_orders_on_main_course_item_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  add_foreign_key "drink_items", "menus"
  add_foreign_key "first_course_items", "menus"
  add_foreign_key "main_course_items", "menus"
  add_foreign_key "menu_lists", "menus"
  add_foreign_key "user_orders", "drink_items"
  add_foreign_key "user_orders", "first_course_items"
  add_foreign_key "user_orders", "main_course_items"
  add_foreign_key "users", "roles"
end
