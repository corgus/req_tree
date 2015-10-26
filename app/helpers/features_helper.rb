module FeaturesHelper

  def sidebar_selected_features
    items = if @feature
      if @feature.id
        selected_features_for(@feature)
      elsif (params[:controller].downcase == 'features') && (parent_id = params[:parent_id])
        selected_features_for(Feature.find(parent_id))
      end
    elsif @requirement
      selected_features_for(@requirement.feature)
    end
    Array(items)
  end

  def root_features
    Feature.where(parent_id: nil).sort
  end

  private

    def selected_features_for(feature)
      [feature, feature.ancestors].flatten if feature
    end

end
