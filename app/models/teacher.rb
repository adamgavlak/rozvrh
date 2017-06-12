class Teacher < ApplicationRecord
  has_many :teacher_courses
  has_many :courses, through: :teacher_courses

  has_many :teacher_group_courses
  has_many :groups, through: :teacher_group_courses

  has_many :documents

  validates :name, presence: true
  validates :email, presence: true

  def lecturer_ids
    ids = self.teacher_courses.select{ |c| c.is_lecturer }.map{|i| i.course_id}
  end

  def total(course)
    t = 0
    lecture = Multiplier.find_by(name: 'Prednáška').value
    classes = Multiplier.find_by(name: 'Cvičenie').value
    labs = Multiplier.find_by(name: 'Laboratórne cvičenie').value
    weeks = 13

    self.teacher_courses.each do |tc|
      if tc.course.id == course.id
        if tc.is_lecturer
          t += tc.course.lectures_weekly * lecture * weeks
        end

        tc.course.groups.each do |group|
          if group.teacher_group_courses?(self.id, tc.course_id)
            t += tc.course.classes_weekly * classes * weeks
            t += tc.course.lab_classes_weekly * labs * weeks
          end
        end
      end
    end

    t
  end

  # Migration
  # t.string :name
  # t.string :email
  # t.timestamps
end
