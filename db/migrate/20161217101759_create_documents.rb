class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
        t.string :filename
        t.integer :sent_count, default: 0
        t.timestamps
    end
  end
end
