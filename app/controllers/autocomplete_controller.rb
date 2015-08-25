class AutocompleteController < ApplicationController

  def features
    return if params[:query].nil?
    es_results = Feature.search params[:query]
    locals = default_params(es_results).merge(select_path: 'feature_display_path')
    if es_results.any?
      render partial: 'shared/autocomplete_results', locals: locals
    else
      render json: {}
    end
  end

  def default_params(results)
    {
      items: results.collect(&:as_json),
      display_properties: [:title],
      type: :location,
      new_item_path: '#'
    }
  end

end
