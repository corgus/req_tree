class AddUserToTestRecord < ActiveRecord::Migration
  def change
    add_column :test_records, :user_id, :integer
  end
end
