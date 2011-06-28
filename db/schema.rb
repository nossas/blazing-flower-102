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

ActiveRecord::Schema.define(:version => 20110628200631) do

  create_table "active_admin_comments", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
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
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",                              :default => false
    t.boolean  "is_campaigner",                         :default => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "active",                                :default => true
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "autofire_emails", :force => true do |t|
    t.text     "from",        :default => "Dev <dev@meurio.org.br>", :null => false
    t.text     "subject",     :default => "Obrigado por participar", :null => false
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "petition_id"
  end

  create_table "petitions", :force => true do |t|
    t.text     "title",                                         :null => false
    t.text     "custom_path"
    t.text     "headline"
    t.text     "description"
    t.text     "call_to_action",          :default => "Assine"
    t.text     "short_description"
    t.boolean  "display_counter",         :default => true,     :null => false
    t.integer  "counter_threshold",       :default => 0,        :null => false
    t.integer  "counter_goal"
    t.boolean  "display_comment_field",   :default => false,    :null => false
    t.text     "comment_question"
    t.boolean  "surface_comments",        :default => false,    :null => false
    t.text     "state",                   :default => "draft",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "media"
    t.text     "call_to_action_headline"
    t.text     "call_to_action_text"
  end

  add_index "petitions", ["custom_path"], :name => "index_petitions_on_custom_path", :unique => true

  create_table "tafs", :force => true do |t|
    t.text     "thank_you_headline", :default => "Obrigado por participar"
    t.text     "thank_you_text"
    t.boolean  "display_orkut",      :default => false,                     :null => false
    t.text     "orkut_title"
    t.text     "orkut_link"
    t.text     "orkut_message"
    t.boolean  "display_facebook",   :default => false,                     :null => false
    t.text     "facebook_title"
    t.text     "facebook_link"
    t.text     "facebook_message"
    t.boolean  "display_twitter",    :default => false,                     :null => false
    t.text     "tweet"
    t.text     "twitter_url"
    t.boolean  "display_email",      :default => false,                     :null => false
    t.text     "email_subject"
    t.text     "email_message"
    t.boolean  "display_copy_url",   :default => false,                     :null => false
    t.integer  "petition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
