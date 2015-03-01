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

ActiveRecord::Schema.define(version: 20150217061733) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reminders", force: :cascade do |t|
    t.text     "origin"
    t.text     "destination"
    t.text     "email"
    t.text     "repeat"
    t.datetime "arrival_time"
    t.boolean  "is_finished",  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reminders", ["arrival_time"], name: "index_reminders_on_arrival_time", using: :btree
  add_index "reminders", ["is_finished"], name: "index_reminders_on_is_finished", using: :btree

end
