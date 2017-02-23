class CreateCourseDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :course_documents do |t|
        t.belongs_to :course, index: true
        t.belongs_to :document, index: true
        t.timestamps
    end
  end
end
