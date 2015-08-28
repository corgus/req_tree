module FeaturesHelper

  def sidebar_selected_features
    if @feature
      if @feature.id
        [@feature, @feature.ancestors].flatten
      elsif (params[:controller].downcase == 'features') && (parent_id = params[:parent_id])
        parent_feature = Feature.find(parent_id)
        [parent_feature, parent_feature.ancestors].flatten
      else
        []
      end
    elsif @requirement
      @requirement.features
    else
      []
    end
  end

  def root_features
    Feature.where(parent_id: nil).sort
  end

end
