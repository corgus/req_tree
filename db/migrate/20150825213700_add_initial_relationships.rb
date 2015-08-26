class AddInitialRelationships < ActiveRecord::Migration
  def change
    create_table :feature_requirements do |t|
      t.integer :feature_id, null: false
      t.integer :requirement_id, null:false
    end
    create_table :requirement_test_cases do |t|
      t.integer :requirement_id, null: false
      t.integer :test_case_id, null: false
    end
    create_table :test_case_test_records do |t|
      t.integer :test_case_id, null: false
      t.integer :test_record_id, null: false
    end
    create_table :requirement_integrations do |t|
      t.integer :requirement_id, null: false
      t.integer :integration_id, null: false
      t.string :integration_class, null: false
    end
  end
end
