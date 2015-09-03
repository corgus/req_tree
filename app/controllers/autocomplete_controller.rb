class AutocompleteController < ApplicationController

  before_action :ensure_query

  def global

  end

  def features
    es_results = Feature.search params[:query]
    locals = result_params(Feature, es_results)
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
      render partial: 'shared/autocomplete_results', locals: locals
    end

end
