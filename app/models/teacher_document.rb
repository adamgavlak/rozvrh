class TeacherDocument < ApplicationRecord
  belongs_to :teacher
  belongs_to :document
end
