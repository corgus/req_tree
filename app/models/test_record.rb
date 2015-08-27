class TestRecord < ActiveRecord::Base
  extend Enumerize
  include Attachable
  include Searchable

  belongs_to :test_case

  enumerize :status, in: [ :pass, :fail, :pending ]
  enumerize :server, in: [ :production, :issues, :beta1, :beta2, :local ]

  validates :status, presence: true, allow_blank: false
  validates :server, presence: true, allow_blank: false
  validates :timestamp, presence: true, allow_blank: false
end
