class RemoveAcceptanceCriteriaFromRequirement < ActiveRecord::Migration
  def up
    remove_column :requirements, :acceptance_criteria
    change_column :requirements, :summary, :text
  end
  def down
    add_column :requirements, :acceptance_criteria, :text
    change_column :requirements, :summery, :string
  end
end
