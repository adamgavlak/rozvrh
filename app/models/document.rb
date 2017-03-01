class Document < ApplicationRecord

    has_many :teacher_documents
    has_many :teachers, through: :teacher_documents

    has_many :course_documents
    has_many :courses, through: :course_documents

end
