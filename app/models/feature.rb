class Feature < ReqTree::Base
  extend Enumerize
  include Attachable
  include Searchable
  include Sortable

  acts_as_tree order: 'position'

  enumerize :status, in: [ :pending, :obsolete, :current ], default: :current

  validates :title, presence: true, allow_blank: false
  validates :position, presence: true, allow_blank: false

  # has_many :feature_requirements
  # has_many :requirements, through: :feature_requirements
  # accepts_nested_attributes_for :feature_requirements, reject_if: :all_blank, allow_destroy: true

  has_many :requirements
  accepts_nested_attributes_for :requirements, reject_if: :all_blank, allow_destroy: true


  def self.destroy_associations_with(id)
    FeatureRequirement.destroy_all(feature_id: id)
  end

  def as_json(opts={})
    super.merge({
      display: breadcrumbs
    })
  end

  def as_indexed_json(opts={})
    self.as_json(only: [:id, :title, :summary])
        .merge({
          'display_path': Rails.application.routes.url_helpers.feature_path(self.id),
          'breadcrumbs': breadcrumbs,
          'ancestors_string': ancestors_string
        })
  end

  def name # alias for use in closure_tree
    title
  end

  def breadcrumbs
    ancestry_path.join(' > ')
  end

  def ancestors_string
    return nil unless ancestry_path.length > 1
    ancestry_path[0...-1].join(' > ') + ' >'
  end

  def log_children
    log children.sort.each{|c| puts "#{c.position} = #{c.title}";}
  end

  def new?
    self.id == nil
  end

  def new_redirect_path
    if requirements.present?
      requirements.first
    elsif parent.present?
      parent
    else
      self
    end
  end

  def destroy_associations
    Feature.destroy_associations_with(self.id)
  end

  def root_requirement
    requirements.unscoped.find_by(feature_root: true)
  end

  def self.search(terms)
    __elasticsearch__.search(
      query: {
        match: {
          breadcrumbs: {
            query: terms,
            fuzziness: 2,
            prefix_length: 1
          }
        }
      },
      highlight: {
        fields: {
          breadcrumbs: {
            term_vector: "with_positions_offsets"
          }
        }
      }
    )
  end

end

Feature.load_index
