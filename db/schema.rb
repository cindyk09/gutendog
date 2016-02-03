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


ActiveRecord::Schema.define(version: 20160203152558) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "notifications", force: :cascade do |t|
    t.integer  "recipient_id"
    t.boolean  "viewed"
    t.boolean  "clicked"
    t.integer  "walk_id"
    t.integer  "request_id"
    t.string   "message"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "notifications", ["recipient_id"], name: "index_notifications_on_recipient_id", using: :btree
  add_index "notifications", ["request_id"], name: "index_notifications_on_request_id", using: :btree
  add_index "notifications", ["walk_id"], name: "index_notifications_on_walk_id", using: :btree

  create_table "ownerships", force: :cascade do |t|
    t.integer  "pet_id"
    t.integer  "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ownerships", ["owner_id"], name: "index_ownerships_on_owner_id", using: :btree
  add_index "ownerships", ["pet_id"], name: "index_ownerships_on_pet_id", using: :btree

  create_table "pets", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
  end

  create_table "petwalks", force: :cascade do |t|
    t.integer  "walk_id"
    t.integer  "pet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "petwalks", ["pet_id"], name: "index_petwalks_on_pet_id", using: :btree
  add_index "petwalks", ["walk_id"], name: "index_petwalks_on_walk_id", using: :btree

  create_table "requests", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean  "pickup"
    t.integer  "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "requests", ["owner_id"], name: "index_requests_on_owner_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "walks", force: :cascade do |t|
    t.integer  "walker_id"
    t.integer  "request_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "completed",  default: false
  end

  add_index "walks", ["request_id"], name: "index_walks_on_request_id", using: :btree
  add_index "walks", ["walker_id"], name: "index_walks_on_walker_id", using: :btree

  add_foreign_key "notifications", "requests"
  add_foreign_key "notifications", "walks"
  add_foreign_key "ownerships", "pets"
  add_foreign_key "ownerships", "users", column: "owner_id"
  add_foreign_key "petwalks", "pets"
  add_foreign_key "petwalks", "walks"
  add_foreign_key "requests", "users", column: "owner_id"
  add_foreign_key "walks", "requests"
  add_foreign_key "walks", "users", column: "walker_id"
end
