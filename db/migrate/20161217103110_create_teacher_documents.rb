class CreateTeacherDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :teacher_documents do |t|
        t.belongs_to :teacher, index: true 
        t.belongs_to :document, index: true
        t.timestamps
    end
  end
end
