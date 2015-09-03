class TestRecord < ActiveRecord::Base
  extend Enumerize
  include Attachable
  include Searchable

  has_many :test_case_test_records
  has_many :test_cases, through: :test_case_test_records
  accepts_nested_attributes_for :test_case_test_records, reject_if: :all_blank, allow_destroy: true

  enumerize :status, in: [ :pass, :fail, :pending ], default: :pass
  enumerize :server, in: [ :production, :issues, :beta1, :beta2, :local ], default: :local

  validates :status, presence: true, allow_blank: false
  validates :server, presence: true, allow_blank: false
  validates :timestamp, presence: true, allow_blank: false

end

TestRecord.load_index
