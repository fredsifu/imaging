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

ActiveRecord::Schema.define(version: 20160113204638) do

  create_table "address_categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "addresses", force: :cascade do |t|
    t.string   "line1"
    t.string   "line2"
    t.string   "city"
    t.string   "region"
    t.string   "country_code"
    t.string   "zipcode"
    t.integer  "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "machines", force: :cascade do |t|
    t.string   "internal_id"
    t.string   "readable_name"
    t.string   "location"
    t.integer  "imaging_type"
    t.string   "model"
    t.string   "serial_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patient_addresses", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "address_id"
  end

  create_table "patient_phones", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "phone_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "insurance_number"
    t.string   "complementary_insurance_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phone_categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "phones", force: :cascade do |t|
    t.string   "number"
    t.integer  "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
