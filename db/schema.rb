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

ActiveRecord::Schema.define(:version => 20161227184243) do

  create_table "aircrafts", :force => true do |t|
    t.string   "aircraft_type"
    t.string   "name"
    t.string   "n_number"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pax"
    t.string   "pricing"
    t.string   "accessibility"
    t.string   "hearing_protection"
    t.string   "flight_intensity"
  end

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attendances", :force => true do |t|
    t.integer  "member_id"
    t.integer  "event_id"
    t.string   "commitment_level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attendances", ["event_id"], :name => "index_attendances_on_event_id"
  add_index "attendances", ["member_id"], :name => "index_attendances_on_member_id"

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

  create_table "document_categories", :force => true do |t|
    t.string   "category_name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dues_payments", :force => true do |t|
    t.integer  "member_id"
    t.string   "payment_method"
    t.string   "payment_type"
    t.decimal  "amt_paid",       :precision => 8, :scale => 2
    t.text     "notes"
    t.date     "date_paid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dues_payments", ["member_id"], :name => "index_dues_payments_on_member_id"

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
    t.integer  "position",         :null => false
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
    t.boolean  "flight_roster",                        :null => false
    t.boolean  "rsvp",              :default => false, :null => false
    t.boolean  "rides_available",                      :null => false
    t.string   "entered_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "graphic_address"
    t.integer  "location_id"
  end

  create_table "events_ride_requests", :id => false, :force => true do |t|
    t.integer "event_id"
    t.integer "ride_request_id"
  end

  add_index "events_ride_requests", ["event_id", "ride_request_id"], :name => "index_events_ride_requests_on_event_id_and_ride_request_id"

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

  create_table "knowledge_tests", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lhfe_flights", :force => true do |t|
    t.datetime "flight_start_time"
    t.integer  "event_id"
    t.integer  "aircraft_id"
    t.text     "flight_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lhfe_flights", ["aircraft_id"], :name => "index_lhfe_flights_on_aircraft_id"
  add_index "lhfe_flights", ["event_id"], :name => "index_lhfe_flights_on_event_id"

  create_table "lhfe_riders", :force => true do |t|
    t.integer  "event_id"
    t.date     "ride_date"
    t.decimal  "payment_amount", :precision => 6, :scale => 4
    t.string   "payment_type"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "street_1"
    t.string   "street_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "home_phone"
    t.string   "work_phone"
    t.string   "email"
    t.date     "dob"
    t.boolean  "married"
    t.string   "spouse_name"
    t.string   "occupation"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "lhfe_riders", ["event_id"], :name => "index_lhfe_riders_on_event_id"

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
    t.integer  "one_way_distance"
  end

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
    t.text     "skills"
    t.boolean  "active"
    t.date     "caf_join_date"
    t.string   "level"
    t.string   "ec_name"
    t.string   "ec_phone",      :limit => 30
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
    t.string   "usual_term_start"
    t.string   "usual_term_length"
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

  create_table "post_versions", :force => true do |t|
    t.string   "item_type",       :null => false
    t.integer  "item_id",         :null => false
    t.string   "event",           :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.string   "author_username"
    t.datetime "created_at"
  end

  add_index "post_versions", ["item_type", "item_id"], :name => "index_post_versions_on_item_type_and_item_id"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "product_photos", :force => true do |t|
    t.integer  "product_id"
    t.string   "caption"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_photos", ["product_id"], :name => "index_product_photos_on_product_id"

  create_table "products", :force => true do |t|
    t.integer  "item_no"
    t.integer  "display_order"
    t.string   "name"
    t.text     "description"
    t.decimal  "value",         :precision => 8, :scale => 2
    t.decimal  "alt_value",     :precision => 8, :scale => 2, :null => false
    t.string   "photo_path"
    t.boolean  "available"
    t.decimal  "ship_handling", :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products_sizes", :id => false, :force => true do |t|
    t.integer "product_id"
    t.integer "size_id"
  end

  add_index "products_sizes", ["product_id", "size_id"], :name => "index_products_sizes_on_product_id_and_size_id"

  create_table "ride_requests", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.string   "state"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "safety_item_versions", :force => true do |t|
    t.string   "item_type",       :null => false
    t.integer  "item_id",         :null => false
    t.string   "event",           :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.string   "author_username"
    t.datetime "created_at"
  end

  add_index "safety_item_versions", ["item_type", "item_id"], :name => "index_safety_item_versions_on_item_type_and_item_id"

  create_table "safety_items", :force => true do |t|
    t.string   "subject"
    t.text     "contents"
    t.text     "resolution"
    t.boolean  "resolved"
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

  create_table "test_answers", :force => true do |t|
    t.integer  "test_question_id"
    t.string   "answer_letter"
    t.text     "answer"
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "test_answers", ["test_question_id"], :name => "index_test_answers_on_test_question_id"

  create_table "test_questions", :force => true do |t|
    t.integer  "knowledge_test_id"
    t.integer  "question_no"
    t.text     "question"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "test_questions", ["knowledge_test_id"], :name => "index_test_questions_on_knowledge_test_id"

  create_table "test_submission_responses", :force => true do |t|
    t.integer  "test_submission_id"
    t.integer  "test_question_id"
    t.integer  "test_answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "test_submission_responses", ["test_answer_id"], :name => "index_test_submission_responses_on_test_answer_id"
  add_index "test_submission_responses", ["test_question_id"], :name => "index_test_submission_responses_on_test_question_id"
  add_index "test_submission_responses", ["test_submission_id"], :name => "index_test_submission_responses_on_test_submission_id"

  create_table "test_submissions", :force => true do |t|
    t.integer  "knowledge_test_id"
    t.integer  "member_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "test_submissions", ["knowledge_test_id"], :name => "index_test_submissions_on_knowledge_test_id"
  add_index "test_submissions", ["member_id"], :name => "index_test_submissions_on_member_id"

  create_table "trips", :force => true do |t|
    t.integer  "event_id"
    t.datetime "crew_arrival"
    t.datetime "tug_time"
    t.datetime "wheels_up"
    t.datetime "destination_eta"
    t.datetime "return_eta"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fuel_start"
    t.integer  "fuel_end"
    t.integer  "oil_start"
    t.integer  "oil_end"
    t.decimal  "hobbs_start",       :precision => 8,  :scale => 1
    t.decimal  "hobbs_end",         :precision => 8,  :scale => 1
    t.decimal  "anuac_cost",        :precision => 10, :scale => 2
    t.integer  "rides_given"
    t.integer  "total_pax"
    t.decimal  "pax_income",        :precision => 10, :scale => 2
    t.decimal  "hq_amount_paid",    :precision => 10, :scale => 2
    t.decimal  "rides_fuel",        :precision => 10, :scale => 2
    t.decimal  "rides_oil",         :precision => 10, :scale => 2
    t.decimal  "t_shirt_cost",      :precision => 10, :scale => 2
    t.decimal  "t_shirt_sales",     :precision => 10, :scale => 2
    t.decimal  "show_fees",         :precision => 10, :scale => 2
    t.decimal  "show_expenses",     :precision => 10, :scale => 2
    t.decimal  "lfhe_hobbs_start",  :precision => 8,  :scale => 1
    t.decimal  "lfhe_hobbs_end",    :precision => 8,  :scale => 1
    t.integer  "show_fuel_gallons"
    t.integer  "show_oil_gallons"
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

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

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
