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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111025004600) do

  create_table "appointments", :force => true do |t|
    t.integer  "patient_id"
    t.integer  "schedule_id"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "doctors", :force => true do |t|
    t.string   "name"
    t.datetime "birthdate"
    t.string   "photo"
    t.string   "username"
    t.string   "password_md5"
    t.integer  "speciality_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "birthdate"
    t.string   "sex"
    t.string   "username"
    t.string   "password_md5"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedule_plans", :force => true do |t|
    t.datetime "start_date"
    t.integer  "doctor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedules", :force => true do |t|
    t.string   "start_hour"
    t.string   "end_hour"
    t.integer  "schedule_plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_date"
    t.datetime "end_date"
  end

  create_table "specialities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
