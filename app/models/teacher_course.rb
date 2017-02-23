class TeacherCourse < ApplicationRecord
  belongs_to :teacher
  belongs_to :course

  has_many :teacher_group_courses
end
