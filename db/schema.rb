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

ActiveRecord::Schema.define(:version => 20140311211541) do

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_posts", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "post_id"
  end

  add_index "categories_posts", ["category_id", "post_id"], :name => "index_categories_posts_on_category_id_and_post_id"

  create_table "crew_positions", :force => true do |t|
    t.string   "position_name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "document_categories", :force => true do |t|
    t.string   "category_name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_addresses", :force => true do |t|
    t.string   "address"
    t.boolean  "active"
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_signups", :force => true do |t|
    t.integer  "event_id"
    t.integer  "member_id"
    t.string   "commitment_level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_signups", ["event_id"], :name => "index_event_signups_on_event_id"
  add_index "event_signups", ["member_id"], :name => "index_event_signups_on_member_id"

  create_table "event_statuses", :primary_key => "ID", :force => true do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_types", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.datetime "start"
    t.datetime "end"
    t.integer  "event_type_id"
    t.string   "title"
    t.integer  "event_statuses_id"
    t.string   "location"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "URL"
    t.string   "contact_info"
    t.text     "details"
    t.string   "entered_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "graphic_address"
    t.integer  "location_id"
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

  create_table "grants", :force => true do |t|
    t.integer  "right_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "short_name"
    t.string   "airport_name"
    t.string   "icao_identifier"
    t.text     "description"
    t.string   "city"
    t.string   "state"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manifests", :force => true do |t|
    t.integer  "event_id"
    t.integer  "member_id"
    t.integer  "crew_position_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "manifests", ["crew_position_id"], :name => "index_manifests_on_crew_position_id"
  add_index "manifests", ["event_id"], :name => "index_manifests_on_event_id"
  add_index "manifests", ["member_id"], :name => "index_manifests_on_member_id"

  create_table "members", :force => true do |t|
    t.integer  "user_id"
    t.integer  "caf_col_no"
    t.date     "dd_dues_date"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street_1"
    t.string   "street_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "home_phone"
    t.string   "work_phone"
    t.string   "cell_phone"
    t.string   "email"
    t.boolean  "active"
    t.date     "join_date"
    t.string   "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["user_id"], :name => "index_members_on_user_id"

  create_table "news", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.date     "date"
    t.string   "source"
    t.string   "ext_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "officer_positions", :force => true do |t|
    t.string   "position_name"
    t.text     "description"
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
    t.string   "path"
  end

  add_index "photos", ["gallery_id", "photographer_id"], :name => "index_photos_on_gallery_id_and_photographer_id"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

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

  create_table "products_sizes", :id => false, :force => true do |t|
    t.integer "product_id"
    t.integer "size_id"
  end

  add_index "products_sizes", ["product_id", "size_id"], :name => "index_products_sizes_on_product_id_and_size_id"

  create_table "rights", :force => true do |t|
    t.string   "resource"
    t.string   "operation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sizes", :force => true do |t|
    t.string   "size"
    t.string   "size_short"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "display_order"
  end

  create_table "squadron_documents", :force => true do |t|
    t.integer  "document_category_id"
    t.string   "title"
    t.text     "description"
    t.string   "file_url"
    t.date     "doc_date"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teasers", :force => true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "terms", :force => true do |t|
    t.integer  "officer_position_id"
    t.integer  "member_id"
    t.date     "term_start"
    t.date     "term_end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "terms", ["member_id"], :name => "index_terms_on_member_id"
  add_index "terms", ["officer_position_id"], :name => "index_terms_on_officer_position_id"

  create_table "trips", :force => true do |t|
    t.integer  "event_id"
    t.datetime "crew_arrival"
    t.datetime "tug_time"
    t.datetime "wheels_up"
    t.datetime "destination_eta"
    t.datetime "return_eta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "trips", ["event_id"], :name => "index_trips_on_event_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                                 :null => false
    t.string   "encrypted_password",                    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.date     "date"
    t.string   "source"
    t.text     "ext_url"
    t.boolean  "publish"
    t.boolean  "members_only"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "video_graphic"
  end

end
