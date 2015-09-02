class TestCase < ActiveRecord::Base
  extend Enumerize
  include Attachable
  include Searchable

  has_many :test_records, through: :test_record_test_cases
  has_many :requirements, through: :requirement_test_cases

  def status
    if test_record = test_records.last
      test.record.fail? ? 'fail' : 'pass'
    else
      manual_process.present? ? 'fail' : 'pass'
    end
  end

end
