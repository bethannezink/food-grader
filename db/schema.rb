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

ActiveRecord::Schema.define(version: 3) do

  create_table "inspections", force: :cascade do |t|
    t.string  "inspection_date"
    t.string  "inspection_type"
    t.string  "grade"
    t.integer "score"
    t.string  "grade_date"
    t.integer "restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone_number"
    t.string "cuisine_style"
    t.string "borough"
  end

  create_table "violations", force: :cascade do |t|
    t.string  "date"
    t.string  "code"
    t.string  "severity_level"
    t.string  "description"
    t.integer "inspection_id"
  end

end
