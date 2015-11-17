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

ActiveRecord::Schema.define(version: 20151117145218) do

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

  create_table "faculties", force: :cascade do |t|
    t.string   "access_id",  limit: 255
    t.string   "lname",      limit: 255
    t.string   "fname",      limit: 255
    t.string   "birth",      limit: 255
    t.string   "birth_year", limit: 255
    t.string   "death",      limit: 255
    t.string   "leave",      limit: 255
    t.string   "dept",       limit: 255
    t.string   "box",        limit: 255
    t.string   "series",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "graduates", force: :cascade do |t|
    t.string   "box",        limit: 255
    t.string   "lastname",   limit: 255
    t.string   "firstname",  limit: 255
    t.string   "year",       limit: 255
    t.string   "department", limit: 255
    t.string   "deathdate",  limit: 255
    t.string   "photos",     limit: 255
    t.string   "oversize",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "honoraries", force: :cascade do |t|
    t.string   "lname",      limit: 255
    t.string   "fname",      limit: 255
    t.string   "year",       limit: 255
    t.string   "death",      limit: 255
    t.string   "degree",     limit: 255
    t.string   "file",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "memorabilia", force: :cascade do |t|
    t.string   "box",         limit: 255
    t.string   "category",    limit: 255
    t.string   "description", limit: 255
    t.string   "classyear",   limit: 255
    t.string   "year",        limit: 255
    t.string   "reunion",     limit: 255
    t.string   "provenance",  limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "access_id",   limit: 255
  end

  create_table "memorials", force: :cascade do |t|
    t.string   "publication",  limit: 255
    t.string   "volume",       limit: 255
    t.string   "no",           limit: 255
    t.string   "publish_date", limit: 255
    t.string   "article_type", limit: 255
    t.string   "subject",      limit: 255
    t.string   "class_year",   limit: 255
    t.string   "class_grade",  limit: 255
    t.string   "page",         limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "nassau_literatures", force: :cascade do |t|
    t.string   "lname",      limit: 255
    t.string   "fname",      limit: 255
    t.string   "classyear",  limit: 255
    t.string   "title",      limit: 255
    t.string   "date",       limit: 255
    t.string   "issue_no",   limit: 255
    t.string   "pages",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "image_num",     limit: 255
    t.string   "box",           limit: 255
    t.string   "item_num",      limit: 255
    t.string   "accession_num", limit: 255
    t.string   "e_num",         limit: 255
    t.string   "negative_num",  limit: 255
    t.string   "image_type",    limit: 255
    t.string   "provenance",    limit: 255
    t.string   "photographer",  limit: 255
    t.string   "date_taken",    limit: 255
    t.string   "division",      limit: 255
    t.string   "subseries",     limit: 255
    t.string   "general_sub",   limit: 255
    t.string   "specific_sub",  limit: 255
    t.string   "publication",   limit: 255
    t.string   "notes",         limit: 255
    t.string   "online_image",  limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "recent_alumni", force: :cascade do |t|
    t.string   "lname",        limit: 255
    t.string   "fname",        limit: 255
    t.string   "year",         limit: 255
    t.string   "pubfile",      limit: 255
    t.string   "academicfile", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "trustees", force: :cascade do |t|
    t.string   "access_id",         limit: 255
    t.string   "full_name",         limit: 255
    t.string   "trustee_type",      limit: 255
    t.string   "dates_of_service",  limit: 255
    t.string   "university_status", limit: 255
    t.string   "first_year",        limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "trustees_minutes", force: :cascade do |t|
    t.string   "access_id",  limit: 255
    t.string   "subject",    limit: 255
    t.string   "volume",     limit: 255
    t.string   "page",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
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

  create_table "wwii_memorials", force: :cascade do |t|
    t.string   "access_id",  limit: 255
    t.string   "rank",       limit: 255
    t.string   "name",       limit: 255
    t.string   "death_date", limit: 255
    t.string   "place",      limit: 255
    t.string   "year",       limit: 255
    t.string   "death_year", limit: 255
    t.string   "last_name",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
