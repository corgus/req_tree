require 'elasticsearch/model'

class Feature < ActiveRecord::Base
  extend Enumerize
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  include Attachable
  include Searchable

  acts_as_tree

  enumerize :status, in: [ :pending, :obsolete, :current ], default: :current

  validates :title, presence: true, allow_blank: false

  def self.as_indexed_json(*)
    as_json(only: [:id, :title, :summary])
  end

end

# Delete the previous features index in Elasticsearch
Feature.__elasticsearch__.client.indices.delete index: Feature.index_name # rescue nil

# Create the new index with the new mapping
Feature.__elasticsearch__.client.indices.create \
  index: Feature.index_name,
  body: { settings: Feature.settings.to_hash, mappings: Feature.mappings.to_hash }

# Index all article records from the DB to Elasticsearch
Feature.import
