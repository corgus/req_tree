class Feature < ActiveRecord::Base
  extend Enumerize
  include Attachable
  include Searchable

  acts_as_tree order: 'position'

  enumerize :status, in: [ :pending, :obsolete, :current ], default: :current

  validates :title, presence: true, allow_blank: false
  validates :position, presence: true, allow_blank: false

  has_many :feature_requirements
  has_many :requirements, through: :feature_requirements
  accepts_nested_attributes_for :feature_requirements, reject_if: :all_blank, allow_destroy: true

  before_validation :set_position


  def self.destroy_associations_with(id)
    FeatureRequirement.destroy_all(feature_id: id)
  end

  def as_indexed_json(opts={})
    self.as_json(only: [:id, :title, :summary])
        .merge({'display_path' => Rails.application.routes.url_helpers.feature_path(self.id)})
  end

  def set_position
    self.position ||= siblings.count
  end

  def name # alias for use in closure_tree
    title
  end

  def breadcrumbs
    ancestry_path.join(' > ')
  end

  def update_position(new_position)
    if target = siblings.find_by(position: new_position)
      target.prepend_sibling(self)
    elsif siblings
      update(position: siblings.count)
    else
      update(position: 0)
    end
  end

  def log_children
    log children.sort.each{|c| puts "#{c.position} = #{c.title}";}
  end

  def <=>(other)
    position > other.position ? 1 : position < other.position ? -1 : 0
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

end

Feature.load_index
