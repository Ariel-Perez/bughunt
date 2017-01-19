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

ActiveRecord::Schema.define(version: 20170119044226) do

  create_table "bugs", force: :cascade do |t|
    t.string   "name",                        null: false
    t.text     "description"
    t.integer  "priority",    default: 0
    t.boolean  "resolved",    default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "user_id"
    t.integer  "score",       default: 0
    t.index ["user_id"], name: "index_bugs_on_user_id"
  end

  create_table "bugs_tags", id: false, force: :cascade do |t|
    t.integer "bug_id", null: false
    t.integer "tag_id", null: false
    t.index ["bug_id", "tag_id"], name: "index_bugs_tags_on_bug_id_and_tag_id"
    t.index ["bug_id"], name: "index_bugs_tags_on_bug_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "bug_id"
    t.integer  "score"
    t.integer  "event_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bug_id"], name: "index_events_on_bug_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "password_confirmation"
    t.string   "password_digest"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "score",                 default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
