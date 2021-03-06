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

ActiveRecord::Schema.define(version: 20140515110028) do

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "isnotify"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "articles", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.boolean  "isparent"
    t.string   "name"
    t.date     "birthday"
    t.string   "address"
    t.string   "email"
    t.string   "education"
    t.string   "majorin"
    t.string   "learningtype"
    t.string   "institute"
    t.string   "period"
    t.string   "certification"
    t.string   "certificationdetail"
    t.string   "level"
    t.integer  "score"
    t.string   "purpose"
    t.text     "purposedetail"
    t.string   "weekness"
    t.string   "bottleneck"
    t.string   "availabletime"
    t.boolean  "tpclass"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "phone"
    t.text     "consultcourse"
  end

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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "photos", force: true do |t|
    t.string   "image"
    t.string   "name"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.string   "title"
    t.string   "cover"
    t.string   "name"
    t.string   "course"
    t.integer  "ranking",    default: 0
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

end
