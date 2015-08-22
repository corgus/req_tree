class AddParentIdToFeature < ActiveRecord::Migration
  def change
    add_column :features, :parent_id, :integer
  end
end
