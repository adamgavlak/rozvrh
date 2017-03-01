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

ActiveRecord::Schema.define(version: 20170107115447) do

  create_table "course_documents", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "document_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["course_id"], name: "index_course_documents_on_course_id"
    t.index ["document_id"], name: "index_course_documents_on_document_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string  "code",                           null: false
    t.string  "name"
    t.integer "lectures_weekly",    default: 0
    t.integer "classes_weekly",     default: 0
    t.integer "lab_classes_weekly", default: 0
  end

  create_table "documents", force: :cascade do |t|
    t.string   "filename"
    t.integer  "sent_count", default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "group_courses", force: :cascade do |t|
    t.integer "group_id"
    t.integer "course_id"
    t.index ["course_id"], name: "index_group_courses_on_course_id"
    t.index ["group_id"], name: "index_group_courses_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string  "group_number"
    t.integer "student_count"
  end

  create_table "teacher_courses", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "course_id"
    t.boolean "is_lecturer", default: false
    t.index ["course_id"], name: "index_teacher_courses_on_course_id"
    t.index ["teacher_id"], name: "index_teacher_courses_on_teacher_id"
  end

  create_table "teacher_documents", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "document_id"
    t.index ["document_id"], name: "index_teacher_documents_on_document_id"
    t.index ["teacher_id"], name: "index_teacher_documents_on_teacher_id"
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

  create_table "wage_categories", force: :cascade do |t|
    t.string "title"
    t.float  "wage_per_hour"
  end

end
