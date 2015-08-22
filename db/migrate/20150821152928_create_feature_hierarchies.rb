class CreateFeatureHierarchies < ActiveRecord::Migration
  def change
    create_table :feature_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :feature_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "feature_anc_desc_idx"

    add_index :feature_hierarchies, [:descendant_id],
      name: "feature_desc_idx"
  end
end
