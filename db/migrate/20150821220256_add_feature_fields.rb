class AddFeatureFields < ActiveRecord::Migration
  def change
    add_column :features, :title, :string
    add_column :features, :summary, :text
    add_column :features, :status, :integer
  end
end
