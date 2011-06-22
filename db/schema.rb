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

ActiveRecord::Schema.define(:version => 20110622181329) do

  create_table "petitions", :force => true do |t|
    t.text     "title",                                       :null => false
    t.text     "custom_path",                                 :null => false
    t.text     "headline"
    t.text     "description"
    t.text     "call_to_action",        :default => "Assine", :null => false
    t.text     "short_description"
    t.boolean  "display_counter",       :default => true,     :null => false
    t.integer  "counter_threshold",     :default => 0,        :null => false
    t.integer  "counter_goal"
    t.boolean  "display_comment_field", :default => false,    :null => false
    t.text     "comment_question"
    t.boolean  "surface_comments",      :default => false,    :null => false
    t.text     "state",                 :default => "draft",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "petitions", ["custom_path"], :name => "index_petitions_on_custom_path", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "admin",                                 :default => false
    t.boolean  "active",                                :default => true
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
