class CreateSearchRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :search_records do |t|
      t.integer :search_id

      t.timestamps
    end
  end
end
