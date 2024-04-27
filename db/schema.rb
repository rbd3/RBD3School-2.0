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

ActiveRecord::Schema[7.1].define(version: 2024_04_27_205502) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "class_assignments", force: :cascade do |t|
    t.string "class_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "class_teachers", force: :cascade do |t|
    t.bigint "class_assignment_id"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_assignment_id"], name: "index_class_teachers_on_class_assignment_id"
    t.index ["teacher_id"], name: "index_class_teachers_on_teacher_id"
  end

  create_table "marks", force: :cascade do |t|
    t.float "mark_value"
    t.bigint "student_id", null: false
    t.bigint "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_marks_on_student_id"
    t.index ["subject_id"], name: "index_marks_on_subject_id"
  end

  create_table "student_subjects", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_subjects_on_student_id"
    t.index ["subject_id"], name: "index_student_subjects_on_subject_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.bigint "class_assignment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_assignment_id"], name: "index_students_on_class_assignment_id"
  end

  create_table "subject_coefficients", force: :cascade do |t|
    t.bigint "subject_id", null: false
    t.integer "coefficient"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "class_assignment_id"
    t.index ["class_assignment_id"], name: "index_subject_coefficients_on_class_assignment_id"
    t.index ["subject_id"], name: "index_subject_coefficients_on_subject_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "subject_taught"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teaching_assignments", force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.bigint "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_teaching_assignments_on_subject_id"
    t.index ["teacher_id"], name: "index_teaching_assignments_on_teacher_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "marks", "students"
  add_foreign_key "marks", "subjects"
  add_foreign_key "student_subjects", "students"
  add_foreign_key "student_subjects", "subjects"
  add_foreign_key "students", "class_assignments"
  add_foreign_key "subject_coefficients", "subjects"
  add_foreign_key "teaching_assignments", "subjects"
  add_foreign_key "teaching_assignments", "teachers"
end
