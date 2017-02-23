class Teacher < ApplicationRecord
  has_many :teacher_courses
  has_many :courses, through: :teacher_courses

  has_many :teacher_documents
  has_many :documents, through: :teacher_documents

  has_many :teacher_group_courses
  has_many :groups, through: :teacher_group_courses

  belongs_to :wage_category

  def lecturer_ids
    ids = self.teacher_courses.select{ |c| c.is_lecturer }.map{|i| i.course_id}
  end
end
