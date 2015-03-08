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

ActiveRecord::Schema.define(version: 20150308060342) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reminders", force: :cascade do |t|
    t.text     "origin",                       null: false
    t.text     "destination",                  null: false
    t.text     "email"
    t.text     "repeat"
    t.datetime "arrival_time",                 null: false
    t.boolean  "is_finished",  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",                      null: false
  end

  add_index "reminders", ["arrival_time"], name: "index_reminders_on_arrival_time", using: :btree
  add_index "reminders", ["is_finished"], name: "index_reminders_on_is_finished", using: :btree
  add_index "reminders", ["user_id"], name: "index_reminders_on_user_id", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.integer  "user_id",          null: false
    t.text     "token",            null: false
    t.datetime "token_expires_at"
  end

  add_index "sessions", ["token"], name: "index_sessions_on_token", using: :btree
  add_index "sessions", ["user_id"], name: "index_sessions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.text    "email",                           null: false
    t.text    "password_digest",                 null: false
    t.boolean "is_admin",        default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

end
