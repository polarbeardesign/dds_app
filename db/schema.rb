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

ActiveRecord::Schema.define(:version => 20120305225236) do

  create_table "event_types", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.datetime "start"
    t.datetime "end"
    t.integer  "event_types_id"
    t.string   "title"
    t.string   "location"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "URL"
    t.string   "contact_info"
    t.text     "details"
    t.string   "entered_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", :force => true do |t|
    t.integer  "gallery_category_id"
    t.string   "gallery_name"
    t.string   "description"
    t.string   "gallery_pic"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "galleries", ["gallery_category_id"], :name => "index_galleries_on_gallery_category_id"

  create_table "gallery_categories", :force => true do |t|
    t.string   "category_name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.date     "date"
    t.string   "source"
    t.string   "ext_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photographers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.integer  "gallery_id"
    t.integer  "photographer_id"
    t.string   "photo_title"
    t.string   "description"
    t.string   "filename"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["gallery_id", "photographer_id"], :name => "index_photos_on_gallery_id_and_photographer_id"

  create_table "products", :force => true do |t|
    t.integer  "item_no"
    t.integer  "display_order"
    t.string   "name"
    t.text     "description"
    t.text     "size"
    t.decimal  "value",         :precision => 10, :scale => 0
    t.string   "photo_path"
    t.boolean  "available"
    t.decimal  "ship_handling", :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
