# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_10_201032) do
  create_table "admins", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["username"], name: "index_admins_on_username", unique: true
  end

  create_table "groups", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "archived"
  end

  create_table "members", force: :cascade do |t|
    t.text "role"
    t.integer "user_id", null: false
    t.integer "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_members_on_group_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "procedures", force: :cascade do |t|
    t.text "title"
    t.integer "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_procedures_on_group_id"
  end

  create_table "project_stages", force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "stage_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_stages_on_project_id"
    t.index ["stage_id"], name: "index_project_stages_on_stage_id"
  end

  create_table "projects", force: :cascade do |t|
    t.text "title"
    t.integer "procedure_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stage_id"
    t.integer "position", default: 1, null: false
    t.index ["procedure_id"], name: "index_projects_on_procedure_id"
  end

  create_table "responsible_people", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "stage_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stage_id"], name: "index_responsible_people_on_stage_id"
    t.index ["user_id"], name: "index_responsible_people_on_user_id"
  end

  create_table "stages", force: :cascade do |t|
    t.text "title"
    t.integer "procedure_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stage_ord"
    t.string "color"
    t.index ["procedure_id"], name: "index_stages_on_procedure_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "author"
    t.text "title"
    t.text "body"
    t.datetime "deadline"
    t.text "status"
    t.integer "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_tasks_on_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "members", "groups"
  add_foreign_key "members", "users"
  add_foreign_key "procedures", "groups"
  add_foreign_key "project_stages", "projects"
  add_foreign_key "project_stages", "stages"
  add_foreign_key "projects", "procedures"
  add_foreign_key "responsible_people", "stages"
  add_foreign_key "responsible_people", "users"
  add_foreign_key "stages", "procedures"
  add_foreign_key "tasks", "groups"
end
