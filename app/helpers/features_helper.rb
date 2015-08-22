module FeaturesHelper

  def sidebar_selected_features
    if @feature
      [@feature]
    elsif @requirement
      @requirement.features
    end
  end

  def root_features
    Feature.where(parent_id: nil)
  end

end
