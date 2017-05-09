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

ActiveRecord::Schema.define(version: 20170405155937) do

  create_table "courses", force: :cascade do |t|
    t.string  "code",                           null: false
    t.string  "name"
    t.integer "lectures_weekly",    default: 0
    t.integer "classes_weekly",     default: 0
    t.integer "lab_classes_weekly", default: 0
  end

  create_table "delayed_jobs", force: :cascade do |t|
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
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "documents", force: :cascade do |t|
    t.integer  "teacher_id"
    t.string   "filename"
    t.string   "status"
    t.integer  "sent_count", default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["teacher_id"], name: "index_documents_on_teacher_id"
  end

  create_table "group_courses", force: :cascade do |t|
    t.integer "group_id"
    t.integer "course_id"
    t.index ["course_id"], name: "index_group_courses_on_course_id"
    t.index ["group_id"], name: "index_group_courses_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "group_number"
  end

  create_table "multipliers", force: :cascade do |t|
    t.string   "name"
    t.decimal  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teacher_courses", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "course_id"
    t.boolean "is_lecturer", default: false
    t.index ["course_id"], name: "index_teacher_courses_on_course_id"
    t.index ["teacher_id"], name: "index_teacher_courses_on_teacher_id"
  end

  create_table "teacher_group_courses", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "group_id"
    t.integer "course_id"
    t.index ["course_id"], name: "index_teacher_group_courses_on_course_id"
    t.index ["group_id"], name: "index_teacher_group_courses_on_group_id"
    t.index ["teacher_id"], name: "index_teacher_group_courses_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "wage_category_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["wage_category_id"], name: "index_teachers_on_wage_category_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
