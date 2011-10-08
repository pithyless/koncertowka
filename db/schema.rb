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

ActiveRecord::Schema.define(:version => 20110921103700) do

  create_table "active_admin_comments", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
    t.index ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], :name => "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"
  end

  create_table "artists", :force => true do |t|
    t.string   "name",        :limit => 60, :null => false
    t.string   "slug",        :limit => 60, :null => false
    t.string   "tagline"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["slug"], :name => "index_artists_on_slug", :unique => true
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name",                                            :null => false
    t.string   "last_name",                                             :null => false
    t.string   "role",                                                  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], :name => "index_users_on_email", :unique => true
    t.index ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  end

  create_table "cities", :force => true do |t|
    t.string "city", :limit => 120, :null => false
    t.index ["city"], :name => "index_cities_on_city", :unique => true
  end

  create_table "venues", :force => true do |t|
    t.string   "slug",                :limit => 60, :null => false
    t.string   "name",                :limit => 60, :null => false
    t.text     "description"
    t.integer  "city_id",                           :null => false
    t.string   "address_street"
    t.integer  "address_postal_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["city_id"], :name => "index_venues_on_city_id"
    t.index ["slug"], :name => "index_venues_on_slug", :unique => true
    t.foreign_key ["city_id"], "cities", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "venues_city_id_fkey"
  end

  create_table "events", :force => true do |t|
    t.integer  "venue_id",                   :null => false
    t.integer  "promoter_id",                :null => false
    t.string   "slug",        :limit => 130, :null => false
    t.string   "title",       :limit => 120, :null => false
    t.text     "description"
    t.datetime "start_at",                   :null => false
    t.datetime "end_at",                     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["promoter_id"], :name => "index_events_on_promoter_id"
    t.index ["slug"], :name => "index_events_on_slug", :unique => true
    t.index ["venue_id"], :name => "index_events_on_venue_id"
    t.foreign_key ["venue_id"], "venues", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "events_venue_id_fkey"
    t.foreign_key ["promoter_id"], "users", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "events_promoter_id_fkey"
  end

  create_table "appearances", :force => true do |t|
    t.integer "artist_id"
    t.integer "event_id"
    t.index ["artist_id"], :name => "index_appearances_on_artist_id"
    t.index ["event_id", "artist_id"], :name => "index_appearances_on_event_id_and_artist_id", :unique => true
    t.foreign_key ["artist_id"], "artists", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "appearances_artist_id_fkey"
    t.foreign_key ["event_id"], "events", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "appearances_event_id_fkey"
  end

end
