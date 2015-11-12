class RenameTypeColumns < ActiveRecord::Migration
  def change
    rename_column :test_cases, :type, :test_case_type
    rename_column :attachments, :type, :attachment_type
  end
end
