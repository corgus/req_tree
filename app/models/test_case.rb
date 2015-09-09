class TestCase < ReqTree::Base
  extend Enumerize
  include Attachable
  include Searchable

  has_many :test_case_test_records
  has_many :test_records, through: :test_case_test_records

  has_many :requirement_test_cases
  has_many :requirements, through: :requirement_test_cases

  validates :title, presence: true, allow_blank: false

  def status
    if test_record = test_records.last
      test.record.fail? ? 'fail' : 'pass'
    else
      automated_test_path.present? ? 'pass' : 'fail'
    end
  end

end

TestCase.load_index
