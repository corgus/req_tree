module ReqTree
  class Base < ActiveRecord::Base
    self.abstract_class = true

    def new?
      id == nil
    end

    def route(query)
      Rails.application.routes.url_helpers.send(query)
    end

    def log(str)
      puts "\n\n///////////////////////////////////////////////\n"
      puts "#{str}\n"
      puts "///////////////////////////////////////////////\n\n"
    end

  end
end

