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

ActiveRecord::Schema.define(version: 20150130222426) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "email_contents", force: true do |t|
    t.string "email"
    t.text   "text"
    t.string "origin"
    t.string "recipient"
  end

  create_table "events", force: true do |t|
    t.integer  "user_id"
    t.datetime "event_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
    t.integer  "role_id"
    t.boolean  "exception"
  end

  add_index "events", ["role_id"], name: "index_events_on_role_id", using: :btree
  add_index "events", ["team_id"], name: "index_events_on_team_id", using: :btree

  create_table "highlights", force: true do |t|
    t.string   "title"
    t.string   "video"
    t.string   "audio"
    t.datetime "created_at"
    t.string   "sermon_link"
    t.string   "slug"
  end

  add_index "highlights", ["slug"], name: "index_highlights_on_slug", using: :btree

  create_table "ministries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", force: true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "sermon_id"
  end

  add_index "notes", ["sermon_id"], name: "index_notes_on_sermon_id", using: :btree
  add_index "notes", ["user_id"], name: "index_notes_on_user_id", using: :btree

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
    t.string   "tags"
  end

  create_table "setlist_songs", force: true do |t|
    t.integer  "setlist_id"
    t.integer  "song_id"
    t.datetime "setlist_songs_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.string   "altkey"
  end

  create_table "setlists", force: true do |t|
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", force: true do |t|
    t.string   "name"
    t.string   "key"
    t.text     "chart"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "chart_alt"
    t.text     "lyrics"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",               default: false
    t.integer  "team_id"
    t.integer  "role_id"
    t.boolean  "reminders",           default: true
    t.string   "last_name"
    t.string   "photo_link"
    t.string   "gender"
    t.date     "birth_date"
    t.string   "address1"
    t.string   "city"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "spouse"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "avatar_remote_url"
    t.string   "phone"
    t.string   "state"
    t.integer  "zip"
    t.boolean  "deactivated",         default: false
    t.boolean  "hide_email",          default: false
    t.boolean  "hide_phone",          default: false
    t.boolean  "hide_address",        default: false
    t.integer  "worship_role_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree
  add_index "users", ["team_id"], name: "index_users_on_team_id", using: :btree
  add_index "users", ["worship_role_id"], name: "index_users_on_worship_role_id", using: :btree

  create_table "worship_roles", force: true do |t|
    t.string "name"
  end

end
