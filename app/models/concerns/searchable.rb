module Searchable

  extend ActiveSupport::Concern

  included do

    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    def self.index_name
      "reqtree_#{to_s.downcase.pluralize}"
    end

    def self.search(terms)
      __elasticsearch__.search(
        query: {
          match: {
            title: {
              query: terms,
              fuzziness: 2,
              prefix_length: 1
            }
          }
        }
      )
    end

    def self.reindex
      # Delete the previous features index in Elasticsearch
      __elasticsearch__.client.indices.delete index: index_name # rescue nil

      # Create the new index with the new mapping
      __elasticsearch__.client.indices.create \
        index: index_name,
        body: { settings: settings.to_hash, mappings: mappings.to_hash }

      # Index all records from the DB to Elasticsearch
      import
    end

  end
end
