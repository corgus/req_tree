class CreateTestRecords < ActiveRecord::Migration
  def change
    create_table :test_records do |t|
      t.integer :status
      t.timestamp :timestamp
      t.integer :server

      t.timestamps null: false
    end
  end
end
