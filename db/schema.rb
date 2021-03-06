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

ActiveRecord::Schema.define(:version => 20140113145509) do

  create_table "exercises", :force => true do |t|
    t.string   "title"
    t.text     "instruction"
    t.text     "pic"
    t.string   "page_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "routine_id"
  end

  create_table "histories", :force => true do |t|
    t.integer  "sets"
    t.integer  "reps"
    t.integer  "workout_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "routine_id"
    t.integer  "weight"
    t.string   "workout_name"
  end

  create_table "mapped_exercises", :force => true do |t|
    t.string   "name"
    t.string   "pic"
    t.integer  "routine_id"
    t.integer  "exercise_id"
    t.integer  "sets"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "routines", :force => true do |t|
    t.string   "name"
    t.text     "days"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "workouts", :force => true do |t|
    t.string   "name"
    t.integer  "routine_id"
    t.integer  "exercise_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
