class Teacher < ApplicationRecord
    has_many :groups
    has_many :teacher_courses
    has_many :courses, through: :teacher_courses

    has_many :teacher_documents
    has_many :documents, through: :teacher_documents
end
