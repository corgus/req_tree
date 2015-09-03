class RequirementIntegration < ReqTree::Base
  belongs_to :requirement
  belongs_to :integration, polymorphic: true
end

