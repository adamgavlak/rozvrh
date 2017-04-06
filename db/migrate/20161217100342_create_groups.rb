class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
        t.string :group_number
    end
  end
end