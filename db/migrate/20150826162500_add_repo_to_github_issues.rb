class AddRepoToGithubIssues < ActiveRecord::Migration
  def change
    add_column :github_issues, :repository, :string
  end
end
