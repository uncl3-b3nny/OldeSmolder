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

ActiveRecord::Schema.define(version: 20141030071508) do

  create_table "events", force: true do |t|
    t.string   "user_id"
    t.string   "title"
    t.string   "workflow_state"
    t.string   "event_type"
    t.string   "history_image_file_path"
    t.text     "notes"
    t.boolean  "allDay"
    t.datetime "start"
    t.datetime "end"
    t.string   "url"
    t.string   "className"
    t.boolean  "editable"
    t.boolean  "startEditable"
    t.boolean  "endEditable"
    t.boolean  "durationEditable"
    t.string   "color"
    t.string   "backgroundColor"
    t.string   "borderColor"
    t.string   "textColor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suggestions", force: true do |t|
    t.integer  "user_id"
    t.string   "primary_category"
    t.string   "primary_subcategory"
    t.string   "secondary_category"
    t.string   "name"
    t.string   "content_title"
    t.text     "content"
    t.string   "options"
    t.string   "address"
    t.string   "time_frame"
    t.string   "budget_size"
    t.string   "suggestion_image_file_path"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_suggestions", force: true do |t|
    t.string   "user_id"
    t.string   "suggestion_id"
    t.string   "workflow_state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "primary_category"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.date     "anniversary"
    t.date     "spouse_birthday"
    t.date     "first_kiss"
    t.date     "first_date"
    t.date     "day_you_proposed"
    t.string   "spouse_amazon_id"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
