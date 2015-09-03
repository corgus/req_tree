class RequirementTestCase < ReqTree::Base
  belongs_to :requirement
  belongs_to :test_case
end
