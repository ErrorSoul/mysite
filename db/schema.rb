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

ActiveRecord::Schema.define(version: 20150814095949) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "assets", force: :cascade do |t|
    t.text     "name",          limit: 65535
    t.string   "asset",         limit: 255
    t.string   "type",          limit: 255
    t.integer  "page_id",       limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.datetime "publicated_at"
    t.integer  "period_id",     limit: 4
  end

  create_table "funds", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.string   "name",       limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "info",       limit: 65535
    t.text     "strategy",   limit: 65535
    t.text     "condition",  limit: 65535
  end

  create_table "pages", force: :cascade do |t|
    t.text     "content",       limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "name",          limit: 255
    t.integer  "pageable_id",   limit: 4
    t.string   "pageable_type", limit: 255
  end

  add_index "pages", ["pageable_type", "pageable_id"], name: "index_pages_on_pageable_type_and_pageable_id", using: :btree

  create_table "partner_pages", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "periods", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "fund_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "pieces", force: :cascade do |t|
    t.date     "observ_date"
    t.decimal  "cost",                  precision: 14, scale: 3
    t.decimal  "pure_cost",             precision: 14, scale: 3
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "fund_id",     limit: 4
  end

  create_table "posts", force: :cascade do |t|
    t.string   "object_type", limit: 255
    t.string   "title",       limit: 255
    t.text     "body",        limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "quartals", force: :cascade do |t|
    t.string   "first_q",    limit: 255
    t.string   "second_q",   limit: 255
    t.string   "third_q",    limit: 255
    t.string   "fourth_q",   limit: 255
    t.integer  "period_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "obj_type",   limit: 255
    t.datetime "first_d"
    t.datetime "second_d"
    t.datetime "third_d"
    t.datetime "fourth_d"
  end

  create_table "redactor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "redactor_assets", ["assetable_type", "assetable_id"], name: "idx_redactor_assetable", using: :btree
  add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_redactor_assetable_type", using: :btree

  create_table "reports", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "phone",      limit: 255
    t.string   "firm",       limit: 255
    t.text     "body",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "obj_type",   limit: 255
  end

end
