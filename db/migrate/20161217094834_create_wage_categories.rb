class CreateWageCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :wage_categories do |t|
      t.string :title
      t.float :wage_per_hour
    end
  end
end
