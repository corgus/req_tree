class UpdateEnumsToUseEnumerize < ActiveRecord::Migration
  def up
    remove_column :features, :status
    add_column    :features, :status, :string
    remove_column :requirements, :status
    add_column    :requirements, :status, :string
    remove_column :test_records, :status
    add_column    :test_records, :status, :string
    remove_column :test_records, :server
    add_column    :test_records, :server, :string
    remove_column :attachments, :type
    add_column    :attachments, :type, :string
  end
end
