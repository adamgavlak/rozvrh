class Course < ApplicationRecord
    has_many :teacher_courses
    has_many :teachers, through: :teacher_courses

    has_many :course_documents
    has_many :documents, through: :course_documents

    has_many :group_courses
    has_many :groups, through: :group_courses

    has_many :teacher_group_courses
end
