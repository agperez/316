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

ActiveRecord::Schema.define(version: 20140601155403) do

  create_table "events", force: true do |t|
    t.integer  "user_id"
    t.datetime "event_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
    t.integer  "role_id"
    t.boolean  "exception"
  end

  add_index "events", ["role_id"], name: "index_events_on_role_id"
  add_index "events", ["team_id"], name: "index_events_on_team_id"

  create_table "roles", force: true do |t|
    t.string  "name"
    t.string  "color"
    t.integer "order"
    t.string  "text_color"
  end

  create_table "sermons", force: true do |t|
    t.string   "book"
    t.integer  "chapter"
    t.integer  "verse_first"
    t.integer  "verse_last"
    t.string   "video"
    t.string   "audio"
    t.string   "speaker"
    t.date     "s_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "outline"
    t.text     "link"
    t.integer  "chapter_last"
    t.string   "announcements"
    t.boolean  "published"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.integer  "team_id"
    t.integer  "role_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"
  add_index "users", ["role_id"], name: "index_users_on_role_id"
  add_index "users", ["team_id"], name: "index_users_on_team_id"

end
