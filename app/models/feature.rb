class Feature < ActiveRecord::Base
  extend Enumerize
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  include Attachable

  acts_as_tree

  enumerize :status, in: [ :pending, :obsolete, :current ], default: :current

  validates :title, presence: true, allow_blank: false

end
