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

ActiveRecord::Schema.define(version: 20151022212801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.string   "url"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "type"
  end

  add_index "attachments", ["resource_id"], name: "index_attachments_on_resource_id", using: :btree

  create_table "feature_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "feature_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "feature_anc_desc_idx", unique: true, using: :btree
  add_index "feature_hierarchies", ["descendant_id"], name: "feature_desc_idx", using: :btree

  create_table "feature_requirements", force: :cascade do |t|
    t.integer "feature_id",     null: false
    t.integer "requirement_id", null: false
  end

  create_table "features", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "parent_id"
    t.string   "title"
    t.text     "summary"
    t.string   "status"
    t.integer  "position"
  end

  create_table "github_issues", force: :cascade do |t|
    t.integer  "github_id"
    t.string   "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "repository"
  end

  create_table "requirement_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "requirement_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "requirement_anc_desc_idx", unique: true, using: :btree
  add_index "requirement_hierarchies", ["descendant_id"], name: "requirement_desc_idx", using: :btree

  create_table "requirement_integrations", force: :cascade do |t|
    t.integer "requirement_id",    null: false
    t.integer "integration_id",    null: false
    t.string  "integration_class", null: false
  end

  create_table "requirement_test_cases", force: :cascade do |t|
    t.integer "requirement_id", null: false
    t.integer "test_case_id",   null: false
  end

  create_table "requirements", force: :cascade do |t|
    t.string   "title"
    t.text     "summary"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "status"
    t.integer  "feature_id"
    t.integer  "position"
    t.integer  "parent_id"
    t.boolean  "feature_root"
  end

  add_index "requirements", ["feature_id"], name: "index_requirements_on_feature_id", using: :btree

  create_table "test_case_test_records", force: :cascade do |t|
    t.integer "test_case_id",   null: false
    t.integer "test_record_id", null: false
  end

  create_table "test_cases", force: :cascade do |t|
    t.string   "title"
    t.string   "summary"
    t.text     "manual_process"
    t.string   "automated_test_path"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "type"
  end

  create_table "test_records", force: :cascade do |t|
    t.datetime "timestamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "status"
    t.string   "server"
    t.text     "summary"
    t.integer  "user_id"
  end

  create_table "trello_cards", force: :cascade do |t|
    t.integer  "card_id"
    t.string   "shortlink"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0, null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
