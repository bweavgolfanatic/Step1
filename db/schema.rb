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

ActiveRecord::Schema.define(:version => 20131109212821) do

  create_table "comments", :force => true do |t|
    t.string   "text",       :null => false
    t.integer  "rating"
    t.integer  "user_id",    :null => false
    t.integer  "post_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "category"
    t.string   "title",      :null => false
    t.integer  "user_id",    :null => false
    t.integer  "num_ratings", :null=> false
    t.integer  "rating"
    t.integer  "difficulty"
    t.boolean  "isfinished", :null => false
    t.boolean  "ispublic",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "step_comments", :force => true do |t|
    t.string   "text",       :null => false
    t.integer  "rating"
    t.integer  "user_id",    :null => false
    t.integer  "step_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "steps", :force => true do |t|
    t.string   "text"
    t.integer  "post_id",              :null => false
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username",            :null => false
    t.float    "rating",              :null => false
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
