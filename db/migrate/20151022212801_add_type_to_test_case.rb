class AddTypeToTestCase < ActiveRecord::Migration
  def change
    add_column :test_cases, :type, :string
  end
end
