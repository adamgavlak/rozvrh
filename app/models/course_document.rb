class CourseDocument < ApplicationRecord
  belongs_to :course, dependent: :destroy
  belongs_to :document, dependent: :destroy
end
