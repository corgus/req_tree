class Requirement < ActiveRecord::Base
  extend Enumerize
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  include Attachable

  has_many :features
  has_many :github_issues
  has_many :trello_cards
  has_many :test_cases

  enumerize :status, in: [ :pending, :obsolete, :current ]

end
