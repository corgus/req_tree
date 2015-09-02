class Requirement < ActiveRecord::Base
  extend Enumerize
  include Attachable
  include Searchable

  has_many :feature_requirements
  has_many :features, through: :feature_requirements
  accepts_nested_attributes_for :feature_requirements, reject_if: :all_blank, allow_destroy: true

  has_many :requirement_integrations
  has_many :github_issues, through: :requirement_integrations,
                           foreign_key: 'integration_id',
                           class_name: 'GithubIssue'
  has_many :trello_cards, through: :requirement_integrations,
                          foreign_key: 'integration_id',
                          class_name: 'TrelloCard'

  has_many :requirement_test_cases
  has_many :test_cases, through: :requirement_test_cases

  enumerize :status, in: [ :pending, :obsolete, :current ], default: :pending

  validates :title, presence: true, allow_blank: false

  def new?
    id == nil
  end

end


if %x(curl -XHEAD -i 'http://localhost:9200/reqtree_requirements').match('404 Not Found')
  %x(curl -XPUT 'http://localhost:9200/reqtree_requirements')
end

# Delete the previous features index in Elasticsearch
Requirement.__elasticsearch__.client.indices.delete index: Requirement.index_name # rescue nil

# Create the new index with the new mapping
Requirement.__elasticsearch__.client.indices.create \
  index: Requirement.index_name,
  body: { settings: Requirement.settings.to_hash, mappings: Requirement.mappings.to_hash }

# Index all article records from the DB to Elasticsearch
Requirement.import
