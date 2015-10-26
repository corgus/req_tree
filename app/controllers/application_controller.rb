class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :pp_params if Rails.env.development?

  protected

    def pp_params
      puts "\n///////////////////// PARAMETERS: /////////////////////\n"
      puts JSON.pretty_generate params
      puts "///////////////////////////////////////////////////////\n\n"
    end

    def log(str)
      puts "\n\n////////////////////////////////\n"
      puts "#{str}\n"
      puts "////////////////////////////////\n\n"
    end

    def route(query)
      Rails.application.routes.url_helpers.send(query)
    end

    # def redirect_back(opts={})
    #   redirect_to(:back, opts)
    # rescue ActionController::RedirectBackError => e
    #   redirect_to root_path
    # rescue ActiveRecord::RecordNotFound => e
    #   redirect_to root_path
    # end

end
