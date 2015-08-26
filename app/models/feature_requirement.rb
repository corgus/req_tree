class FeatureRequirement < ActiveRecord::Base
  belongs_to :feature
  belongs_to :requirement
end
