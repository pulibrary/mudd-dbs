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

ActiveRecord::Schema.define(version: 2015_11_17_145218) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alumni", force: :cascade do |t|
    t.string "box"
    t.string "lname"
    t.string "fname"
    t.string "year"
    t.string "graduate"
    t.string "photos"
    t.string "oversize"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "archboards", force: :cascade do |t|
    t.decimal "numbers_assigned"
    t.integer "original_assigned"
    t.string "building_info_sheet"
    t.string "drawing_title"
    t.string "drawing_number"
    t.string "project_type"
    t.string "drawing_type"
    t.string "board_date"
    t.string "board_dimensions"
    t.string "color"
    t.string "drawing_view"
    t.string "elevation"
    t.string "comments"
    t.string "contractor1_type"
    t.string "contractor1_name"
    t.string "contractor2_type"
    t.string "contractor2_name"
    t.string "contractor3_type"
    t.string "contractor3_name"
    t.integer "proposal"
    t.integer "not_constructed"
    t.integer "bw_fiche"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "audio_visuals", force: :cascade do |t|
    t.string "item"
    t.string "box"
    t.string "topic"
    t.string "title"
    t.string "creator"
    t.string "year"
    t.string "format"
    t.string "color"
    t.string "duration"
    t.string "copied"
    t.string "notes"
    t.string "id3"
    t.string "index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faculties", force: :cascade do |t|
    t.string "access_id"
    t.string "lname"
    t.string "fname"
    t.string "birth"
    t.string "birth_year"
    t.string "death"
    t.string "leave"
    t.string "dept"
    t.string "box"
    t.string "series"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "graduates", force: :cascade do |t|
    t.string "box"
    t.string "lastname"
    t.string "firstname"
    t.string "year"
    t.string "department"
    t.string "deathdate"
    t.string "photos"
    t.string "oversize"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "honoraries", force: :cascade do |t|
    t.string "lname"
    t.string "fname"
    t.string "year"
    t.string "death"
    t.string "degree"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memorabilia", force: :cascade do |t|
    t.string "box"
    t.string "category"
    t.string "description"
    t.string "classyear"
    t.string "year"
    t.string "reunion"
    t.string "provenance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "access_id"
  end

  create_table "memorials", force: :cascade do |t|
    t.string "publication"
    t.string "volume"
    t.string "no"
    t.string "publish_date"
    t.string "article_type"
    t.string "subject"
    t.string "class_year"
    t.string "class_grade"
    t.string "page"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nassau_literatures", force: :cascade do |t|
    t.string "lname"
    t.string "fname"
    t.string "classyear"
    t.string "title"
    t.string "date"
    t.string "issue_no"
    t.string "pages"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string "image_num"
    t.string "box"
    t.string "item_num"
    t.string "accession_num"
    t.string "e_num"
    t.string "negative_num"
    t.string "image_type"
    t.string "provenance"
    t.string "photographer"
    t.string "date_taken"
    t.string "division"
    t.string "subseries"
    t.string "general_sub"
    t.string "specific_sub"
    t.string "publication"
    t.string "notes"
    t.string "online_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recent_alumni", force: :cascade do |t|
    t.string "lname"
    t.string "fname"
    t.string "year"
    t.string "pubfile"
    t.string "academicfile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trustees", force: :cascade do |t|
    t.string "access_id"
    t.string "full_name"
    t.string "trustee_type"
    t.string "dates_of_service"
    t.string "university_status"
    t.string "first_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trustees_minutes", force: :cascade do |t|
    t.string "access_id"
    t.string "subject"
    t.string "volume"
    t.string "page"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wwii_memorials", force: :cascade do |t|
    t.string "access_id"
    t.string "rank"
    t.string "name"
    t.string "death_date"
    t.string "place"
    t.string "year"
    t.string "death_year"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
