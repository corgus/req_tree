class TestCase < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  include Attachable

  has_many :test_records
  has_many :requirements
end
