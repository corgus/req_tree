class CreateGithubIssues < ActiveRecord::Migration
  def change
    create_table :github_issues do |t|
      t.integer :github_id
      t.string :path

      t.timestamps null: false
    end
  end
end
