class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
        t.string :course_code, null: false
        t.integer :lectures_weekly
        t.integer :classes_weekly
        t.integer :lab_classes_weekly
    end
  end
end
