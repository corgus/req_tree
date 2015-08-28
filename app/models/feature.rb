require 'elasticsearch/model'

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

  before_validation :set_position

  def self.as_indexed_json(*)
    as_json(only: [:id, :title, :summary])
  end

  def set_position
    self.position ||= parent.children.count + 1
  end

  def name # alias for use in closure_tree
    title
  end

  def breadcrumbs
    ancestry_path.join(' > ')
  end

  def update_position(new_position)
    siblings.find_by(position: new_position).prepend_sibling(self)
  end

  def log_children
    puts "\n///////////"
    puts children.sort.each{|c| puts "#{c.position} = #{c.title}";};
    puts "///////////\n"
  end

  def <=>(other)
    position > other.position ? 1 : position < other.position ? -1 : 0
  end

end


if %x(curl -XHEAD -i 'http://localhost:9200/reqtree_features').match('404 Not Found')
  %x(curl -XPUT 'http://localhost:9200/reqtree_features')
end

# Delete the previous features index in Elasticsearch
Feature.__elasticsearch__.client.indices.delete index: Feature.index_name # rescue nil

# Create the new index with the new mapping
Feature.__elasticsearch__.client.indices.create \
  index: Feature.index_name,
  body: { settings: Feature.settings.to_hash, mappings: Feature.mappings.to_hash }

# Index all article records from the DB to Elasticsearch
Feature.import
