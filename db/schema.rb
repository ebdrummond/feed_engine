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

ActiveRecord::Schema.define(:version => 20130519190540) do

  create_table "auth_sources", :force => true do |t|
    t.string   "token"
    t.string   "secret"
    t.string   "uid"
    t.string   "provider"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "auth_sources", ["provider"], :name => "index_auth_sources_on_provider"
  add_index "auth_sources", ["uid"], :name => "index_auth_sources_on_uid"
  add_index "auth_sources", ["user_id", "provider"], :name => "index_auth_sources_on_user_id_and_provider", :unique => true

  create_table "check_ins", :force => true do |t|
    t.datetime "checked_in_at"
    t.string   "check_in_id"
    t.text     "text"
    t.string   "location"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "check_ins", ["check_in_id"], :name => "index_check_ins_on_check_in_id", :unique => true
  add_index "check_ins", ["user_id"], :name => "index_check_ins_on_user_id"

  create_table "notes", :force => true do |t|
    t.string   "text",       :null => false
    t.integer  "trip_id",    :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "photos", :force => true do |t|
    t.datetime "taken_at"
    t.string   "photo_id"
    t.string   "url"
    t.text     "caption"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "photos", ["photo_id"], :name => "index_photos_on_photo_id", :unique => true
  add_index "photos", ["user_id"], :name => "index_photos_on_user_id"

  create_table "trips", :force => true do |t|
    t.string   "name"
    t.string   "destination"
    t.date     "start"
    t.date     "end"
    t.boolean  "visible",     :default => false, :null => false
    t.integer  "user_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "tweets", :force => true do |t|
    t.datetime "tweeted_at", :null => false
    t.string   "tweet_id",   :null => false
    t.string   "text"
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tweets", ["tweet_id"], :name => "index_tweets_on_tweet_id", :unique => true
  add_index "tweets", ["user_id"], :name => "index_tweets_on_user_id"

  create_table "user_trips", :force => true do |t|
    t.integer  "user_id"
    t.integer  "trip_id"
    t.string   "trip_role"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_trips", ["trip_id"], :name => "index_user_trips_on_trip_id"
  add_index "user_trips", ["user_id", "trip_id"], :name => "index_user_trips_on_user_id_and_trip_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "avatar"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
