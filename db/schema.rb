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

ActiveRecord::Schema.define(:version => 20131216045018) do

  create_table "comments", :force => true do |t|
    t.string   "text",        :null => false
    t.integer  "rating",      :null => false
    t.integer  "num_ratings", :null => false
    t.integer  "user_id",     :null => false
    t.integer  "post_id",     :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  :recipient
    t.string   :subject
    t.string   :body
    t.integer  :sender
  end

  create_table "posts", :force => true do |t|
    t.string   "category",    :null => false
    t.string   "title",       :null => false
    t.integer  "user_id",     :null => false
    t.integer  "num_ratings", :null => false
    t.integer  "rating",      :null => false
    t.integer  "difficulty",  :null => false
    t.integer  "isfinished",  :null => false
    t.integer  "ispublic",    :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "scomments", :force => true do |t|
    t.string   "text",        :null => false
    t.integer  "rating",      :null => false
    t.integer  "num_ratings", :null => false
    t.integer  "user_id",     :null => false
    t.integer  "step_id",     :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "steps", :force => true do |t|
    t.string   "text",       :null => false
    t.integer  "post_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.binary   "pic",        :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",      :null => false
    t.float    "rating",        :null => false
    t.integer  "num_ratings",   :null => false
    t.string   "password_hash", :null => false
    t.string   "password_salt", :null => false
    t.binary   "avatar"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "voters", :force => true do |t|
    t.string   "username",   :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
