class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
        t.references :teacher, index: true, foreign_key: true
        t.string :group_number
        t.integer :student_count
    end
  end
end