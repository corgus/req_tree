class RequirementTestCase < ActiveRecord::Base
  belongs_to :requirement
  belongs_to :test_case
end
