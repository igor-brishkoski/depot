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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150521192046) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"
  enable_extension "pg_stat_statements"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "addresses", force: true do |t|
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid     "uuid"
    t.string   "latitude"
    t.string   "longitude"
  end

  create_table "amenities", force: true do |t|
    t.string   "name"
    t.text     "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "default",        default: false
    t.boolean  "show_as_filter"
  end

  add_index "amenities", ["show_as_filter"], name: "index_amenities_on_show_as_filter", using: :btree

  create_table "api_keys", force: true do |t|
    t.string   "access_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "apps", force: true do |t|
    t.string   "kind"
    t.string   "iframe_url"
    t.integer  "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "path"
  end

  add_index "apps", ["path"], name: "index_apps_on_path", using: :btree

  create_table "assignments", force: true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "assignments", ["role_id", "user_id"], name: "index_assignments_on_role_id_and_user_id", using: :btree
  add_index "assignments", ["role_id"], name: "index_assignments_on_role_id", using: :btree
  add_index "assignments", ["user_id"], name: "index_assignments_on_user_id", using: :btree

  create_table "attachments", force: true do |t|
    t.string   "url"
    t.string   "caption"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.integer  "row_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachments", ["attachable_id"], name: "index_attachments_on_attachable_id", using: :btree

  create_table "attendances", force: true do |t|
    t.string   "attend_type", null: false
    t.integer  "attendee_id", null: false
    t.integer  "event_id",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "attendances", ["attendee_id", "event_id"], name: "index_attendances_on_attendee_id_and_event_id", using: :btree
  add_index "attendances", ["attendee_id"], name: "index_attendances_on_attendee_id", using: :btree
  add_index "attendances", ["event_id"], name: "index_attendances_on_event_id", using: :btree

  create_table "benefits", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",     default: true
  end

  create_table "bookmarks", force: true do |t|
    t.integer "bookmarker_id"
    t.integer "bookmarked_id"
  end

  create_table "brainstorms", force: true do |t|
    t.string   "name"
    t.integer  "profile_id"
    t.boolean  "active",     default: true
    t.uuid     "uuid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "background", default: 0
  end

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "name"
    t.text     "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "collaborators", force: true do |t|
    t.integer  "profile_id"
    t.integer  "project_id"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "collaborators", ["profile_id"], name: "index_collaborators_on_profile_id", using: :btree
  add_index "collaborators", ["project_id"], name: "index_collaborators_on_project_id", using: :btree

  create_table "comments", force: true do |t|
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.integer  "post_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree

  create_table "countries", force: true do |t|
    t.string "name"
    t.string "iso"
  end

  create_table "custom_pages", force: true do |t|
    t.string  "name"
    t.integer "location_id"
    t.boolean "active"
    t.string  "template_type"
  end

  add_index "custom_pages", ["name"], name: "index_custom_pages_on_name", unique: true, using: :btree

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "dismissed_notices", force: true do |t|
    t.integer  "user_id"
    t.string   "notice_key"
    t.string   "notice_desc"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "dismissed_notices", ["notice_key"], name: "index_dismissed_notices_on_notice_key", using: :btree
  add_index "dismissed_notices", ["user_id"], name: "index_dismissed_notices_on_user_id", using: :btree

  create_table "endorsements", force: true do |t|
    t.integer  "endorser_id"
    t.integer  "endorseable_id"
    t.string   "endorseable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "endorser_type"
    t.text     "skill"
  end

  add_index "endorsements", ["endorseable_id", "endorseable_type"], name: "index_endorsements_on_endorseable_id_and_endorseable_type", using: :btree
  add_index "endorsements", ["endorseable_id"], name: "index_endorsements_on_endorseable_id", using: :btree
  add_index "endorsements", ["endorser_id", "endorser_type"], name: "index_endorsements_on_endorser_id_and_endorser_type", using: :btree
  add_index "endorsements", ["endorser_id"], name: "index_endorsements_on_endorser_id", using: :btree
  add_index "endorsements", ["skill"], name: "index_endorsements_on_skill", using: :btree

  create_table "events", force: true do |t|
    t.string   "name"
    t.integer  "host_id"
    t.string   "host_name"
    t.string   "host_email"
    t.string   "host_phone"
    t.integer  "location_id"
    t.string   "secondary_location"
    t.text     "description"
    t.string   "budget"
    t.string   "notes"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "host_photo_file_name"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.datetime "start_datetime_in_utc"
    t.datetime "end_datetime_in_utc"
    t.integer  "non_member_attendances_count", default: 0
    t.string   "category_url"
    t.uuid     "uuid"
    t.string   "location_description"
    t.boolean  "is_public",                    default: false
    t.integer  "offsite_location_id"
    t.datetime "deleted_at"
    t.string   "event_type"
  end

  add_index "events", ["deleted_at"], name: "index_events_on_deleted_at", using: :btree
  add_index "events", ["event_type"], name: "index_events_on_event_type", using: :btree
  add_index "events", ["host_id"], name: "index_events_on_host_id", using: :btree
  add_index "events", ["is_public"], name: "index_events_on_is_public", using: :btree
  add_index "events", ["location_id"], name: "index_events_on_location_id", using: :btree
  add_index "events", ["uuid"], name: "index_events_on_uuid", using: :btree

  create_table "flags", force: true do |t|
    t.string   "flaggable_type"
    t.string   "reason"
    t.integer  "flaggable_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "flags", ["flaggable_id"], name: "index_flags_on_flaggable_id", using: :btree
  add_index "flags", ["flaggable_type"], name: "index_flags_on_flaggable_type", using: :btree
  add_index "flags", ["user_id"], name: "index_flags_on_user_id", using: :btree

  create_table "follows", force: true do |t|
    t.integer  "followable_id",                   null: false
    t.string   "followable_type",                 null: false
    t.integer  "follower_id",                     null: false
    t.string   "follower_type",                   null: false
    t.boolean  "blocked",         default: false, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables", using: :btree
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows", using: :btree

  create_table "form_submissions", force: true do |t|
    t.hstore   "opts"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "lead_source_detail"
    t.string   "salesforce_lead_id"
    t.hstore   "experiment_params"
  end

  add_index "form_submissions", ["opts"], name: "index_form_submissions_on_opts", using: :gist

  create_table "forms", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.json     "properties", default: {}
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "title"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "group_memberships", force: true do |t|
    t.integer  "profile_id"
    t.integer  "group_id"
    t.string   "membership_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "group_memberships", ["profile_id", "group_id"], name: "index_group_memberships_on_profile_id_and_group_id", unique: true, using: :btree

  create_table "groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "photo"
    t.uuid     "uuid",        null: false
    t.integer  "location_id"
  end

  add_index "groups", ["location_id"], name: "index_groups_on_location_id", using: :btree
  add_index "groups", ["uuid"], name: "index_groups_on_uuid", unique: true, using: :btree

  create_table "guides", force: true do |t|
    t.integer  "location_id"
    t.string   "location_cover_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "safety_guide_url"
    t.string   "emergency_text",     default: "Call 911 immediately."
  end

  create_table "identities", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "leads", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "company_name"
    t.string   "company_website"
    t.string   "location_city"
    t.string   "location_building"
    t.string   "office_desks"
    t.string   "office_plan"
    t.date     "company_founded"
    t.string   "company_employees"
    t.string   "company_customers"
    t.string   "company_headquarters"
    t.text     "wework_services"
    t.text     "challenges"
    t.uuid     "uuid"
    t.string   "wizard_step"
    t.text     "additional_services"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "company_type"
    t.string   "virtual_member"
    t.string   "heard_from"
    t.text     "why_interested"
    t.string   "when_is_space_needed"
    t.string   "availability"
    t.string   "date"
    t.string   "time"
    t.string   "sfid"
  end

  create_table "line_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id", using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

  create_table "location_amenities", force: true do |t|
    t.integer  "location_id"
    t.integer  "amenity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "location_amenities", ["amenity_id"], name: "index_location_amenities_on_amenity_id", using: :btree
  add_index "location_amenities", ["location_id"], name: "index_location_amenities_on_location_id", using: :btree

  create_table "location_clients", force: true do |t|
    t.integer  "location_id"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "location_clients", ["location_id", "client_id"], name: "index_location_clients_on_location_id_and_client_id", using: :btree

  create_table "location_team_members", force: true do |t|
    t.integer  "location_id"
    t.integer  "team_member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "location_team_members", ["location_id"], name: "index_location_team_members_on_location_id", using: :btree
  add_index "location_team_members", ["team_member_id"], name: "index_location_team_members_on_team_member_id", using: :btree

  create_table "locations", force: true do |t|
    t.string   "name"
    t.string   "uuid"
    t.string   "line1"
    t.string   "line2"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "time_zone"
    t.string   "email"
    t.string   "phone"
    t.text     "description"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "salesforce_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "image_url"
    t.integer  "row_order"
    t.integer  "market_id"
    t.string   "city"
    t.boolean  "coming_soon"
    t.json     "desk_pricing",        default: {}
    t.json     "office_pricing",      default: {}
    t.boolean  "published",           default: false
    t.string   "slug"
    t.string   "page_title"
    t.text     "page_description"
    t.boolean  "active_for_anywhere", default: false
    t.integer  "form_id"
    t.boolean  "full",                default: false
    t.string   "public_name"
  end

  add_index "locations", ["latitude", "longitude"], name: "index_locations_on_latitude_and_longitude", using: :btree
  add_index "locations", ["market_id", "published", "coming_soon", "name"], name: "index_locations_on_mid_and_pubed_and_cs_and_name", using: :btree
  add_index "locations", ["market_id"], name: "index_locations_on_market_id", using: :btree
  add_index "locations", ["published"], name: "index_locations_on_published", where: "(published = true)", using: :btree
  add_index "locations", ["slug"], name: "index_locations_on_slug", unique: true, using: :btree
  add_index "locations", ["uuid"], name: "index_locations_on_uuid", unique: true, using: :btree

  create_table "mailboxer_conversation_opt_outs", force: true do |t|
    t.integer "unsubscriber_id"
    t.string  "unsubscriber_type"
    t.integer "conversation_id"
  end

  create_table "mailboxer_conversations", force: true do |t|
    t.string   "subject",        default: ""
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "messages_count", default: 0,  null: false
  end

  add_index "mailboxer_conversations", ["subject"], name: "index_mailboxer_conversations_on_subject", using: :btree

  create_table "mailboxer_notifications", force: true do |t|
    t.string   "type"
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.datetime "updated_at",                              null: false
    t.datetime "created_at",                              null: false
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "notification_code"
    t.string   "attachment"
    t.string   "message_type",         default: "normal"
    t.text     "encrypted_body"
    t.text     "encrypted_subject"
    t.boolean  "broadcast",            default: false
  end

  add_index "mailboxer_notifications", ["broadcast", "conversation_id"], name: "index_notifications_on_broadcast_and_cid", using: :btree
  add_index "mailboxer_notifications", ["conversation_id"], name: "index_notifications_on_cid", using: :btree
  add_index "mailboxer_notifications", ["type", "conversation_id"], name: "index_notifications_on_t_and_cid", using: :btree

  create_table "mailboxer_receipts", force: true do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
  add_index "mailboxer_receipts", ["receiver_type", "receiver_id"], name: "index_mailboxer_receipts_on_receiver_type_and_receiver_id", using: :btree

  create_table "market_suggestions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "markets", force: true do |t|
    t.string   "name"
    t.string   "prefix"
    t.string   "country"
    t.string   "phone"
    t.string   "email"
    t.text     "description"
    t.string   "twitter"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "row_order"
    t.string   "slug"
    t.text     "image_url"
    t.string   "page_title"
    t.text     "page_description"
    t.string   "thumbnail_url"
  end

  add_index "markets", ["latitude", "longitude"], name: "index_markets_on_latitude_and_longitude", using: :btree
  add_index "markets", ["row_order"], name: "index_markets_on_row_order", using: :btree
  add_index "markets", ["slug"], name: "index_markets_on_slug", unique: true, using: :btree

  create_table "measurements", force: true do |t|
    t.datetime "recorded_at"
    t.string   "name"
    t.string   "value"
    t.uuid     "user_uuid"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.uuid     "web_visitor_uuid"
  end

  add_index "measurements", ["user_uuid"], name: "index_measurements_on_user_uuid", using: :btree

  create_table "non_member_attendances", force: true do |t|
    t.integer  "event_id"
    t.string   "email"
    t.string   "attend_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "non_member_attendances", ["event_id"], name: "index_non_member_attendances_on_event_id", using: :btree

  create_table "notification_actions", force: true do |t|
    t.integer  "subject_id"
    t.string   "subject_type"
    t.string   "action_type"
    t.text     "notifiable"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "oauth_access_grants", force: true do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.string   "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree

  create_table "oauth_access_tokens", force: true do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        null: false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree

  create_table "oauth_applications", force: true do |t|
    t.string   "name",         null: false
    t.string   "uid",          null: false
    t.string   "secret",       null: false
    t.string   "redirect_uri", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "owner_id"
    t.string   "owner_type"
  end

  add_index "oauth_applications", ["owner_id", "owner_type"], name: "index_oauth_applications_on_owner_id_and_owner_type", using: :btree
  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree

  create_table "offsite_locations", force: true do |t|
    t.string   "address_1"
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.uuid     "uuid"
    t.string   "full_offsite_address"
  end

  add_index "offsite_locations", ["uuid"], name: "index_offsite_locations_on_uuid", using: :btree

  create_table "posts", force: true do |t|
    t.text     "content"
    t.string   "kind"
    t.boolean  "active"
    t.integer  "profile_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.text     "meta_data"
    t.integer  "event_id"
    t.integer  "comments_count",     default: 0
    t.integer  "want_id"
    t.datetime "last_interacted_at"
    t.uuid     "uuid"
    t.integer  "brainstorm_id"
    t.string   "photo"
    t.integer  "postable_id"
    t.string   "postable_type"
  end

  add_index "posts", ["created_at"], name: "index_posts_on_created_at", using: :btree
  add_index "posts", ["event_id"], name: "index_posts_on_event_id", using: :btree
  add_index "posts", ["kind"], name: "index_posts_on_kind", using: :btree
  add_index "posts", ["last_interacted_at"], name: "index_posts_on_last_interacted_at", using: :btree
  add_index "posts", ["profile_id"], name: "index_posts_on_profile_id", using: :btree
  add_index "posts", ["updated_at"], name: "index_posts_on_updated_at", using: :btree
  add_index "posts", ["uuid"], name: "index_posts_on_uuid", using: :btree
  add_index "posts", ["want_id"], name: "index_posts_on_want_id", using: :btree

  create_table "privacies", force: true do |t|
    t.integer  "user_id"
    t.boolean  "display_gender",              default: true
    t.boolean  "display_age",                 default: true
    t.boolean  "display_relationship_status", default: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "privacies", ["user_id"], name: "index_privacies_on_user_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.decimal  "price",       precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.text     "bio"
    t.text     "phones"
    t.boolean  "active",                               default: true,  null: false
    t.integer  "user_id"
    t.text     "websites"
    t.boolean  "admin",                                default: false
    t.string   "tagline"
    t.text     "meta_data"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "title"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "is_company",                           default: false
    t.string   "company_name"
    t.string   "industry"
    t.integer  "location_id"
    t.string   "wizard_step"
    t.boolean  "receive_notifications",                default: true
    t.string   "floor"
    t.string   "contact_email"
    t.uuid     "company_uuid"
    t.string   "phone"
    t.string   "service_offering_title"
    t.text     "service_offering_body"
    t.text     "service_offering_category"
    t.string   "cover"
    t.integer  "home_location_id"
    t.integer  "tagged_location_id"
    t.text     "potential_home_locations"
    t.integer  "ssrn_count",                           default: 0
    t.boolean  "receive_broadcast_notifications",      default: true
    t.boolean  "receive_message_notifications",        default: true
    t.datetime "deleted_at"
    t.boolean  "receive_push_notifications",           default: true
    t.boolean  "is_public",                            default: true,  null: false
    t.boolean  "receive_building_event_notifications", default: true
    t.boolean  "receive_city_event_notifications",     default: true
    t.hstore   "settings"
  end

  add_index "profiles", ["deleted_at"], name: "index_profiles_on_deleted_at", using: :btree
  add_index "profiles", ["location_id"], name: "index_profiles_on_location_id", using: :btree
  add_index "profiles", ["tagged_location_id"], name: "index_profiles_on_tagged_location_id", using: :btree
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "profile_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "status"
  end

  add_index "projects", ["profile_id"], name: "index_projects_on_profile_id", using: :btree

  create_table "questions", force: true do |t|
    t.string   "content",    null: false
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "questions", ["post_id"], name: "index_questions_on_post_id", using: :btree

  create_table "recommendations", force: true do |t|
    t.text     "content"
    t.string   "status"
    t.string   "kind"
    t.integer  "recommendee_id"
    t.integer  "recommender_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "recommendations", ["recommendee_id"], name: "index_recommendations_on_recommendee_id", using: :btree
  add_index "recommendations", ["recommender_id"], name: "index_recommendations_on_recommender_id", using: :btree

  create_table "regions", force: true do |t|
    t.string "description"
  end

  create_table "reviews", force: true do |t|
    t.text     "review"
    t.integer  "rating"
    t.integer  "user_id"
    t.integer  "reviewable_id"
    t.string   "reviewable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "roles", ["name"], name: "index_roles_on_name", unique: true, using: :btree

  create_table "schedule_tours", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "company"
    t.string   "industry"
    t.string   "num_desks"
    t.string   "move_in_date"
    t.string   "prior_location"
    t.text     "why_interested"
    t.string   "heard_of_wework"
    t.text     "heard_of_wework_other"
    t.string   "locations"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "form_type"
  end

  create_table "scores", force: true do |t|
    t.integer  "scoreable_id"
    t.string   "scoreable_type"
    t.float    "score"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "scores", ["scoreable_id", "scoreable_type", "score"], name: "index_scores_on_scoreable_id_and_scoreable_type_and_score", using: :btree
  add_index "scores", ["updated_at"], name: "index_scores_on_updated_at", using: :btree

  create_table "seats", force: true do |t|
    t.integer  "profile_id"
    t.integer  "user_id"
    t.boolean  "primary"
    t.boolean  "admin"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "email"
    t.boolean  "claimed",    default: false
    t.boolean  "declined",   default: false
  end

  add_index "seats", ["email"], name: "index_seats_on_email", using: :btree
  add_index "seats", ["profile_id"], name: "index_seats_on_profile_id", using: :btree
  add_index "seats", ["user_id"], name: "index_seats_on_user_id", using: :btree

  create_table "slugs", force: true do |t|
    t.string   "sluggable_type"
    t.string   "slug"
    t.integer  "sluggable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "slugs", ["slug"], name: "index_slugs_on_slug", using: :btree
  add_index "slugs", ["sluggable_id"], name: "index_slugs_on_sluggable_id", using: :btree
  add_index "slugs", ["sluggable_type"], name: "index_slugs_on_sluggable_type", using: :btree

  create_table "social_profiles", force: true do |t|
    t.integer  "socialable_id"
    t.string   "platform"
    t.string   "url"
    t.string   "token"
    t.string   "secret"
    t.string   "image_url"
    t.string   "socialable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "uid"
  end

  create_table "split_experiments", force: true do |t|
    t.string   "name"
    t.integer  "version"
    t.string   "value"
    t.integer  "participant_count"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "split_experiments", ["name", "version", "value"], name: "index_split_experiments_on_name_and_version_and_value", unique: true, using: :btree

  create_table "sticky_posts", force: true do |t|
    t.integer  "profile_id"
    t.text     "content"
    t.integer  "location_id"
    t.datetime "expires_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "sticky_posts", ["location_id"], name: "index_sticky_posts_on_location_id", using: :btree
  add_index "sticky_posts", ["profile_id"], name: "index_sticky_posts_on_profile_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "team_members", force: true do |t|
    t.string   "name"
    t.string   "position"
    t.text     "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tour_priorities", force: true do |t|
    t.integer  "location_id"
    t.integer  "priority_location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tour_priorities", ["location_id"], name: "index_tour_priorities_on_location_id", using: :btree
  add_index "tour_priorities", ["priority_location_id"], name: "index_tour_priorities_on_priority_location_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",                                   null: false
    t.string   "email",                                  null: false
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "gender"
    t.datetime "dob"
    t.string   "wework_token"
    t.uuid     "uuid",                                   null: false
    t.string   "relationship_status"
    t.datetime "deleted_at"
    t.string   "kind",                default: "member"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree
  add_index "users", ["uuid"], name: "index_users_on_uuid", unique: true, using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  create_table "votes", force: true do |t|
    t.boolean  "vote",          default: false, null: false
    t.integer  "voteable_id",                   null: false
    t.string   "voteable_type",                 null: false
    t.integer  "voter_id"
    t.string   "voter_type"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "votes", ["voteable_id", "voteable_type"], name: "index_votes_on_voteable_id_and_voteable_type", using: :btree
  add_index "votes", ["voter_id", "voter_type", "voteable_id", "voteable_type"], name: "fk_one_vote_per_user_per_entity", unique: true, using: :btree
  add_index "votes", ["voter_id", "voter_type"], name: "index_votes_on_voter_id_and_voter_type", using: :btree

  create_table "wants", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "profile_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "kind"
    t.string   "status"
    t.integer  "location_id"
    t.uuid     "uuid"
    t.integer  "urgency",                     default: 0
    t.boolean  "active",                      default: true
    t.hstore   "declined_profile_uuids"
    t.hstore   "participating_profile_uuids"
  end

  add_index "wants", ["location_id"], name: "index_wants_on_location_id", using: :btree
  add_index "wants", ["profile_id"], name: "index_wants_on_profile_id", using: :btree
  add_index "wants", ["uuid"], name: "index_wants_on_uuid", using: :btree

end
