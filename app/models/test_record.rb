class TestRecord < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  include Attachable

  belongs_to :test_case

  enumerize :status, in: [ :pass, :fail, :pending ]
  enumerize :server, in: [ :production, :issues, :beta1, :beta2, :local ]
end
