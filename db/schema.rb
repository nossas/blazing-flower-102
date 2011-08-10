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

ActiveRecord::Schema.define(:version => 20110810173817) do

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
    t.text     "from",        :default => "Alessandra Orofino <alessandra@meurio.org.br>", :null => false
    t.text     "subject",     :default => "Obrigado por participar",                       :null => false
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "petition_id"
  end

  add_index "autofire_emails", ["petition_id"], :name => "index_autofire_emails_on_petition_id"

  create_table "comment_flags", :force => true do |t|
    t.integer  "member_id",  :null => false
    t.integer  "comment_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comment_flags", ["comment_id", "member_id"], :name => "index_comment_flags_on_comment_id_and_member_id", :unique => true

  create_table "comments", :force => true do |t|
    t.integer  "member_id",        :null => false
    t.integer  "commentable_id",   :null => false
    t.string   "commentable_type", :null => false
    t.text     "content",          :null => false
    t.boolean  "comment_accepted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id", "commentable_type"], :name => "index_comments_on_commentable_id_and_commentable_type"

  create_table "debates", :force => true do |t|
    t.text     "question",                   :null => false
    t.text     "quote_side_1"
    t.text     "quote_side_2"
    t.text     "text_side_1"
    t.text     "text_side_2"
    t.integer  "issue_id"
    t.text     "author_email_side_1",        :null => false
    t.text     "author_email_side_2",        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "author_title_side_1"
    t.text     "author_title_side_2"
    t.text     "author_organization_side_1"
    t.text     "author_organization_side_2"
    t.text     "title",                      :null => false
  end

  add_index "debates", ["author_email_side_1"], :name => "index_debates_on_author_email_side_1"
  add_index "debates", ["author_email_side_2"], :name => "index_debates_on_author_email_side_2"

  create_table "issues", :force => true do |t|
    t.text     "name"
    t.text     "excerpt"
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "featured_petition_id"
    t.integer  "featured_debate_id"
    t.integer  "featured_personal_story_id"
    t.text     "debate_call_to_action"
    t.text     "petition_call_to_action"
    t.text     "personal_story_call_to_action"
  end

  create_table "jobs", :force => true do |t|
    t.text     "title",                         :null => false
    t.text     "description",                   :null => false
    t.boolean  "active",      :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", :force => true do |t|
    t.text     "zona"
    t.text     "email",      :null => false
    t.text     "celular"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name", :null => false
    t.string   "last_name",  :null => false
    t.string   "image_url"
  end

  add_index "members", ["email"], :name => "index_members_on_email", :unique => true

  create_table "personal_stories", :force => true do |t|
    t.text     "title"
    t.text     "description"
    t.integer  "issue_id"
    t.string   "connected_action"
    t.text     "video_embed_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "thumbnail"
    t.text     "video_url"
    t.text     "excerpt"
  end

  create_table "petition_signatures", :force => true do |t|
    t.integer  "member_id",        :null => false
    t.integer  "petition_id",      :null => false
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "comment_accepted"
  end

  add_index "petition_signatures", ["member_id"], :name => "index_petition_signatures_on_member_id"
  add_index "petition_signatures", ["petition_id", "member_id"], :name => "index_petition_signatures_on_petition_id_and_member_id", :unique => true

  create_table "petitions", :force => true do |t|
    t.text     "title",                                         :null => false
    t.text     "custom_path",                                   :null => false
    t.text     "headline"
    t.text     "description"
    t.text     "call_to_action",          :default => "Assine", :null => false
    t.text     "short_description"
    t.boolean  "display_counter",         :default => true,     :null => false
    t.integer  "counter_threshold",       :default => 0,        :null => false
    t.integer  "counter_goal",            :default => 0,        :null => false
    t.boolean  "display_comment_field",   :default => false,    :null => false
    t.text     "comment_question"
    t.boolean  "surface_comments",        :default => false,    :null => false
    t.text     "state",                   :default => "draft",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "media",                                         :null => false
    t.text     "call_to_action_headline",                       :null => false
    t.text     "call_to_action_text",                           :null => false
    t.text     "media_caption"
    t.integer  "issue_id"
  end

  add_index "petitions", ["custom_path"], :name => "index_petitions_on_custom_path", :unique => true

  create_table "provider_authorizations", :force => true do |t|
    t.integer  "member_id",  :null => false
    t.text     "provider",   :null => false
    t.text     "uid",        :null => false
    t.text     "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "provider_authorizations", ["member_id", "provider"], :name => "index_provider_authorizations_on_member_id_and_provider", :unique => true
  add_index "provider_authorizations", ["provider", "uid"], :name => "index_provider_authorizations_on_provider_and_uid", :unique => true

  create_table "tafs", :force => true do |t|
    t.text     "thank_you_headline",          :default => "Obrigado por participar"
    t.text     "thank_you_text"
    t.boolean  "display_orkut",               :default => false,                     :null => false
    t.text     "orkut_title"
    t.text     "orkut_link"
    t.text     "orkut_message"
    t.boolean  "display_facebook",            :default => false,                     :null => false
    t.text     "facebook_title"
    t.text     "facebook_link"
    t.text     "facebook_message"
    t.boolean  "display_twitter",             :default => false,                     :null => false
    t.text     "tweet"
    t.text     "twitter_url"
    t.boolean  "display_email",               :default => false,                     :null => false
    t.text     "email_subject"
    t.text     "email_message"
    t.boolean  "display_copy_url",            :default => false,                     :null => false
    t.integer  "petition_id",                                                        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "facebook_image_file_name"
    t.string   "facebook_image_content_type"
    t.integer  "facebook_image_file_size"
    t.datetime "facebook_image_updated_at"
  end

  add_index "tafs", ["petition_id"], :name => "index_tafs_on_petition_id", :unique => true

  create_table "widgets", :force => true do |t|
    t.text     "title"
    t.text     "link"
    t.text     "image_file_name"
    t.text     "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "type",               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
