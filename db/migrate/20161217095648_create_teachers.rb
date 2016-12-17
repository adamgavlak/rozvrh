class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
        t.string :personal_number
        t.string :name
        t.boolean :is_lecturer, default: false
        t.float :wage
        
        t.timestamps
    end
  end
end
