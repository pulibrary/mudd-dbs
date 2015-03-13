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

ActiveRecord::Schema.define(version: 20150309203449) do

  create_table "alumni", force: :cascade do |t|
    t.string   "box",        limit: 255
    t.string   "lname",      limit: 255
    t.string   "fname",      limit: 255
    t.string   "year",       limit: 255
    t.string   "graduate",   limit: 255
    t.string   "photos",     limit: 255
    t.string   "oversize",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "archboards", force: :cascade do |t|
    t.decimal  "numbers_assigned",                precision: 10
    t.integer  "original_assigned",   limit: 4
    t.string   "building_info_sheet", limit: 255
    t.string   "drawing_title",       limit: 255
    t.string   "drawing_number",      limit: 255
    t.string   "project_type",        limit: 255
    t.string   "drawing_type",        limit: 255
    t.string   "board_date",          limit: 255
    t.string   "board_dimensions",    limit: 255
    t.string   "color",               limit: 255
    t.string   "drawing_view",        limit: 255
    t.string   "elevation",           limit: 255
    t.string   "comments",            limit: 255
    t.string   "contractor1_type",    limit: 255
    t.string   "contractor1_name",    limit: 255
    t.string   "contractor2_type",    limit: 255
    t.string   "contractor2_name",    limit: 255
    t.string   "contractor3_type",    limit: 255
    t.string   "contractor3_name",    limit: 255
    t.integer  "proposal",            limit: 4
    t.integer  "not_constructed",     limit: 4
    t.integer  "bw_fiche",            limit: 4
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "audio_visuals", force: :cascade do |t|
    t.string   "item",       limit: 255
    t.string   "box",        limit: 255
    t.string   "topic",      limit: 255
    t.string   "title",      limit: 255
    t.string   "creator",    limit: 255
    t.string   "year",       limit: 255
    t.string   "format",     limit: 255
    t.string   "color",      limit: 255
    t.string   "duration",   limit: 255
    t.string   "copied",     limit: 255
    t.string   "notes",      limit: 255
    t.string   "id3",        limit: 255
    t.string   "index",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "new_alumni", force: :cascade do |t|
    t.string   "lname",        limit: 255
    t.string   "fname",        limit: 255
    t.string   "year",         limit: 255
    t.string   "pubfile",      limit: 255
    t.string   "academicfile", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
