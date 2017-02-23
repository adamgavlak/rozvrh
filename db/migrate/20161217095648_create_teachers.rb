class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
        t.string :name
        t.string :email
        t.references :wage_category

        t.timestamps
    end
  end
end
