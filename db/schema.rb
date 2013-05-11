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

ActiveRecord::Schema.define(:version => 20130511150001) do

  create_table "contacts", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "participant_id"
    t.string   "relation"
    t.string   "phone_1"
    t.string   "phone_1_type"
    t.string   "phone_2"
    t.string   "phone_2_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "groups", :force => true do |t|
    t.integer  "number"
    t.integer  "min_grade"
    t.integer  "max_grade"
    t.integer  "min_age"
    t.integer  "max_age"
    t.string   "homeroom"
    t.integer  "leader_id"
    t.integer  "rotation"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "leaders", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
    t.date     "date_of_birth"
    t.string   "notes"
    t.string   "phone"
    t.string   "specialty"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "meals", :force => true do |t|
    t.string   "food"
    t.date     "date"
    t.float    "cost"
    t.integer  "number"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "yummy_tummy_day_order_id"
    t.integer  "meal_id"
    t.integer  "quantity"
    t.boolean  "delivered"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "participants", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
    t.string   "role"
    t.integer  "group_id"
    t.date     "date_of_birth"
    t.string   "notes"
    t.integer  "grade"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.string   "role"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "yummy_tummy_day_orders", :force => true do |t|
    t.integer  "participant_id"
    t.float    "total_cost"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end
