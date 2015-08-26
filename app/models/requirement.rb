class Requirement < ActiveRecord::Base
  extend Enumerize
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  include Attachable

  has_many :feature_requirements
  has_many :features, through: :feature_requirements

  has_many :requirement_integrations
  has_many :github_issues, through: :requirement_integrations,
                           foreign_key: 'integration_id',
                           class_name: 'GithubIssue'
  has_many :trello_cards, through: :requirement_integrations,
                          foreign_key: 'integration_id',
                          class_name: 'TrelloCard'

  has_many :requirement_test_cases
  has_many :test_cases, through: :requirement_test_cases

  enumerize :status, in: [ :pending, :obsolete, :current ]

end
