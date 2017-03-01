class Course < ApplicationRecord
  has_many :teacher_courses
  has_many :teachers, through: :teacher_courses

  has_many :course_documents
  has_many :documents, through: :course_documents

  has_many :group_courses
  has_many :groups, through: :group_courses

  has_many :teacher_group_courses

  # Migration
  # t.string :code, null: false
  # t.string :name
  # t.integer :lectures_weekly, default: 0
  # t.integer :classes_weekly, default: 0
  # t.integer :lab_classes_weekly, default: 0

  # Validations
  validates :code, presence: true
  validates :name, presence: true
  validates :lectures_weekly, presence: true
  validates :classes_weekly, presence: true
  validates :lab_classes_weekly, presence: true

end
