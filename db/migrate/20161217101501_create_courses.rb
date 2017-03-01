class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
        t.string :code, null: false
        t.string :name
        t.integer :lectures_weekly, default: 0
        t.integer :classes_weekly, default: 0
        t.integer :lab_classes_weekly, default: 0
    end
  end
end
