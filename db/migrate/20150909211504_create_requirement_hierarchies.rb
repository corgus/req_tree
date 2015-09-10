class CreateRequirementHierarchies < ActiveRecord::Migration
  def change
    create_table :requirement_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :requirement_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "requirement_anc_desc_idx"

    add_index :requirement_hierarchies, [:descendant_id],
      name: "requirement_desc_idx"

    add_column :requirements, :parent_id, :integer
    add_column :requirements, :feature_root, :boolean
  end
end
