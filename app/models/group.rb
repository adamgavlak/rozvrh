class Group < ApplicationRecord
    # Definície vzťahov medzi modelmi
    has_many :group_courses, dependent: :destroy
    has_many :courses, through: :group_courses

    has_many :teacher_group_courses
    has_many :teachers, through: :teacher_group_courses

    default_scope { order(group_number: :asc) }

    # Validácie
    validates :group_number, presence: true, uniqueness: {case_sensitive: false}

    def teacher_group_courses?(teacher_id, course_id)
      tgc = TeacherGroupCourse.where('teacher_id = ? and group_id = ? and course_id = ?', teacher_id, self.id, course_id).first
      tgc.present?
    end

    # Funkcia na import z CSV súboru
    def self.import(file)
      CSV.foreach(file.path, row_sep: :auto, col_sep: ";") do |row|
        row.each do |column|
          if /\d{1}\w{2}[\w\d]{3}/.match(column)
            Group.create(group_number: column)
          end
        end
      end
    end
end
