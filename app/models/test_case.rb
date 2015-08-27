class TestCase < ActiveRecord::Base
  extend Enumerize
  include Attachable
  include Searchable

  has_many :test_records, through: :test_record_test_cases
  has_many :requirements, through: :requirement_test_cases

end
