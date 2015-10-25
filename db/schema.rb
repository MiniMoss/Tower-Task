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

ActiveRecord::Schema.define(version: 20151025070025) do

  create_table "accesses", force: :cascade do |t|
    t.string   "role",       limit: 255
    t.integer  "user_id",    limit: 4
    t.integer  "team_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "content",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "todo_id",    limit: 4
  end

  add_index "comments", ["todo_id"], name: "index_comments_on_todo_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "event_type",    limit: 255
    t.datetime "event_time"
    t.string   "event_creator", limit: 255
    t.string   "event_topic",   limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "team_id",    limit: 4
  end

  add_index "projects", ["team_id"], name: "index_projects_on_team_id", using: :btree

  create_table "projects_events", id: false, force: :cascade do |t|
    t.integer "project_id", limit: 4
    t.integer "event_id",   limit: 4
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "todos", force: :cascade do |t|
    t.string   "topic",       limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "project_id",  limit: 4
  end

  add_index "todos", ["project_id"], name: "index_todos_on_project_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "comments", "todos"
  add_foreign_key "projects", "teams"
  add_foreign_key "todos", "projects"
end
