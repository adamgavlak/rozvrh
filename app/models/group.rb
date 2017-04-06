class Group < ApplicationRecord
    has_many :group_courses, dependent: :destroy
    has_many :courses, through: :group_courses

    has_many :teacher_group_courses
    has_many :teachers, through: :teacher_group_courses

    # Migration
    # t.string :group_number
    # t.integer :student_count

    # Validations
    validates :group_number, presence: true

    def teacher_group_courses?(teacher_id, course_id)
      tgc = TeacherGroupCourse.where('teacher_id = ? and group_id = ? and course_id = ?', teacher_id, self.id, course_id).first

      if tgc.present?
        true
      else
        false
      end
    end
end
