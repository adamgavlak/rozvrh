class TeacherGroupCourse < ApplicationRecord
  belongs_to :teacher
  belongs_to :group
  belongs_to :course

  def group_number
    self.group.group_number
  end

  def exists?(teacher_id, group_id, course_id)
    
  end
end