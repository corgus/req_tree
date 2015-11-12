class TestCase < ReqTree::Base
  extend Enumerize
  include Attachable
  include Searchable

  enumerize :test_case_type, in: [ :manual, :automated ], default: :manual

  has_many :test_case_test_records
  has_many :test_records, through: :test_case_test_records
  accepts_nested_attributes_for :test_case_test_records, reject_if: :all_blank, allow_destroy: true

  has_many :requirement_test_cases
  has_many :requirements, through: :requirement_test_cases
  accepts_nested_attributes_for :requirement_test_cases, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true, allow_blank: false

  def status
    if test_record = test_records.last
      test_record.fail? ? 'fail' : 'pass'
    else
      automated_test_path.present? ? 'pass' : 'fail'
    end
  end

end

TestCase.load_index
