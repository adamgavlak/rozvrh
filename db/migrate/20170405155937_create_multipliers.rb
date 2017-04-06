class CreateMultipliers < ActiveRecord::Migration[5.0]
  def change
    create_table :multipliers do |t|
      t.string :name
      t.decimal :value
      t.timestamps
    end
  end
end
