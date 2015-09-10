class SingleFeatureRequirements < ActiveRecord::Migration
  def change
    add_reference :requirements, :feature, index: true
    add_column :requirements, :position, :integer
  end
end
