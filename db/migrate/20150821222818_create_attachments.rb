class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :url
      t.integer :type
      t.integer :resource_id
      t.string :resource_type

      t.timestamps null: false
    end

    add_index :attachments, :resource_id
  end
end
