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

ActiveRecord::Schema.define(version: 20170226042054) do

  create_table "auditoria", force: :cascade do |t|
    t.string   "name"
    t.integer  "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name",                null: false
    t.string   "email",               null: false
    t.string   "cc_number",           null: false
    t.string   "cc_expiration_month", null: false
    t.string   "cc_expiration_year",  null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.string   "director"
    t.string   "synopsis"
    t.string   "run_time"
    t.decimal  "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.string   "confirmation_no"
    t.integer  "customer_id"
    t.integer  "showtime_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "showtimes", force: :cascade do |t|
    t.date     "date"
    t.time     "time"
    t.integer  "movie_id"
    t.integer  "auditorium_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
