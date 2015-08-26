class AddSummaryToTestRecord < ActiveRecord::Migration
  def change
    add_column :test_records, :summary, :text
  end
end
