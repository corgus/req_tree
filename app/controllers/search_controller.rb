class SearchController < ApplicationController

  before_action :ensure_query

  def anything
    results_features = Feature.search(params[:query]).collect(&:as_json)
    results_requirements = Requirement.search(params[:query]).collect(&:as_json)
    results_test_cases = TestCase.search(params[:query]).collect(&:as_json)
    log "#{results_features}"
     # " \n\n #{results_requirements} \n\n #{results_test_cases}"
    render partial: 'anything',
           locals: { results_features: results_features,
                     results_requirements: results_requirements,
                     results_test_cases: results_test_cases}

  end

  def features
    es_results = Feature.search params[:query]
    locals = result_params(Feature, es_results,
                           { display_properties: [:ancestors_string, :title] })
    render_results(es_results, locals)
  end

  def requirements
    es_results = Requirement.search params[:query]
    locals = result_params(Requirement, es_results)
    render_results(es_results, locals)
  end

  def test_cases
    es_results = TestCase.search params[:query]
    locals = result_params(TestCase, es_results)
    render_results(es_results, locals)
  end

  # def test_records
  #   es_results = TestRecord.search params[:query]
  #   locals = result_params(TestRecord, es_results)
  #   render_results(es_results, locals)
  # end

  private

    def ensure_query
      return unless params[:query].present?
    end

    def result_params(klass, results, opts={})
      type = klass.to_s.underscore
      new_item_path = Rails.application.routes.url_helpers.send("new_#{type}_path")
      new_item_path << "?#{params[:new]}" if params[:new]
      {
        items: results.collect(&:as_json),
        display_properties: [:title],
        select_path: 'display_path',
        type: type,
        new_item_path: new_item_path
      }.merge(opts)
    end

    def render_results(es_results, locals)
      render partial: 'results', locals: locals
    end

end
