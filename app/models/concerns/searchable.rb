module Searchable
  extend ActiveSupport::Concern

  included do

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

  end
end
