class AddFeaturePosition < ActiveRecord::Migration
  def change
    add_column :features, :position, :integer
  end
end
