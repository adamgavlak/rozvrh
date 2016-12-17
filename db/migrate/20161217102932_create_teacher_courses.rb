class CreateTeacherCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :teacher_courses do |t|
        t.belongs_to :teacher, index: true
        t.belongs_to :course, index: true
    end
  end
end
