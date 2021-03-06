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

ActiveRecord::Schema.define(version: 20160424210727) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "clue_checkins", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "clue_id"
    t.float    "lat"
    t.float    "long"
    t.boolean  "correct"
    t.float    "distance_from_correct"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "clues", force: :cascade do |t|
    t.integer  "location_id"
    t.text     "description"
    t.float    "lat"
    t.float    "long"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "location_checkins", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "location_id"
    t.float    "lat"
    t.float    "long"
    t.boolean  "correct"
    t.float    "distance_from_correct"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "locations", force: :cascade do |t|
    t.integer  "rush_id"
    t.integer  "rush_order"
    t.string   "name"
    t.text     "description"
    t.float    "lat"
    t.float    "long"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "rushes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "scheduled_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "user_rushes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "rush_id"
    t.float    "lat"
    t.float    "long"
    t.integer  "active_location", default: 1
    t.datetime "checked_in_at"
    t.boolean  "complete"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin"
    t.integer  "points",                 default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count"
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
