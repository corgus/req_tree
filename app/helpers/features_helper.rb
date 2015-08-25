module FeaturesHelper

  def sidebar_selected_features
    if @feature
      if @feature.id
        [@feature, @feature.ancestors].flatten
      elsif (params[:controller].downcase == 'features') && (parent_id = params[:parent_id])
        [Feature.find(parent_id)]
      end
    elsif @requirement
      @requirement.features
    end
  end

  def root_features
    Feature.where(parent_id: nil)
  end

end
