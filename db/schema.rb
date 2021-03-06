# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100730143113) do

  create_table "items", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "item_type"
    t.integer  "contact",    :default => 1
  end

  create_table "locations", :force => true do |t|
    t.decimal  "lat",           :precision => 15, :scale => 10
    t.decimal  "lng",           :precision => 15, :scale => 10
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
    t.float    "distance"
  end

  create_table "photo_containers", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.integer  "parent_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.integer  "photo_container_id"
    t.string   "description",          :limit => 1000
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_container_type"
  end

  create_table "requests", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sitenames", :force => true do |t|
    t.integer  "site_id"
    t.string   "value"
    t.string   "language"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", :force => true do |t|
    t.string   "siteable_type"
    t.integer  "parent_id"
    t.boolean  "active"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sitetextnames", :force => true do |t|
    t.integer  "sitetext_id"
    t.string   "value"
    t.string   "language"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
  end

  create_table "sitetexts", :force => true do |t|
    t.string   "textable_type"
    t.boolean  "active"
    t.boolean  "archive"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "textable_id"
    t.integer  "position"
    t.string   "align",         :default => "full"
  end

  create_table "tag_names", :force => true do |t|
    t.integer  "tag_id"
    t.string   "value"
    t.string   "language"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tag_values", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.string   "language"
    t.string   "value",         :limit => 2000
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.string   "taggable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.integer  "position"
    t.string   "value_type"
    t.integer  "visible",       :default => 1
    t.integer  "searchable",    :default => 0
    t.integer  "important_tag", :default => 0
    t.text     "searchables"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstname",     :default => ""
    t.string   "lastname",      :default => ""
    t.boolean  "admin",         :default => false, :null => false
  end

  create_table "workshops", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

end
