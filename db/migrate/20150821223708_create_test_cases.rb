class CreateTestCases < ActiveRecord::Migration
  def change
    create_table :test_cases do |t|
      t.string :title
      t.string :summary
      t.text :manual_process
      t.string :automated_test_path

      t.timestamps null: false
    end
  end
end
