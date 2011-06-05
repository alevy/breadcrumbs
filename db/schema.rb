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

ActiveRecord::Schema.define(:version => 20110602194931) do

  create_table "checkins", :force => true do |t|
    t.integer  "trip_id",      :null => false
    t.integer  "location_id",  :null => false
    t.date     "arrival_date", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "checkins", ["location_id"], :name => "index_checkins_on_location_id"
  add_index "checkins", ["trip_id"], :name => "index_checkins_on_trip_id"

  create_table "comments", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "email",      :null => false
    t.string   "website"
    t.string   "comment",    :null => false
    t.integer  "post_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"

  create_table "locations", :force => true do |t|
    t.string   "city",                :null => false
    t.string   "administrative_zone"
    t.string   "country",             :null => false
    t.string   "region",              :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "checkin_id"
    t.integer  "trip_id"
  end

  add_index "posts", ["checkin_id"], :name => "index_posts_on_checkin_id"
  add_index "posts", ["trip_id"], :name => "index_posts_on_trip_id"

  create_table "trips", :force => true do |t|
    t.string   "title",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
