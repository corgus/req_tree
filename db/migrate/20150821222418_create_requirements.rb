class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.string :title
      t.string :summary
      t.text :acceptance_criteria
      t.integer :status

      t.timestamps null: false
    end
  end
end
