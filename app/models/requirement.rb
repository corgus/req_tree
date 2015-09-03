class Requirement < ReqTree::Base
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
  accepts_nested_attributes_for :requirement_test_cases, reject_if: :all_blank, allow_destroy: true

  enumerize :status, in: [ :pending, :obsolete, :current ], default: :pending

  validates :title, presence: true, allow_blank: false

  scope :without_features, -> { includes(:feature_requirements).where(feature_requirements: {feature_id: nil}) }
  scope :with_features, -> { includes(:feature_requirements).where.not(feature_requirements: {feature_id: nil}) }


  def self.destroy_associations_with(id)
    FeatureRequirement.destroy_all(requirement_id: id)
    RequirementIntegration.destroy_all(requirement_id: id)
    RequirementTestCase.destroy_all(requirement_id: id)
  end

  def new?
    id == nil
  end

  def new_redirect_path
    if features.present?
      features.first
    elsif test_cases.present?
      test_cases.first
    else
      self
    end
  end

  def destroy_associations
    Requirement.destroy_associations_with(self.id)
  end

end

Requirement.load_index
