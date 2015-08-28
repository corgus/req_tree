require 'active_support/concern'

module ActiveRecordUtilities
  extend ActiveSupport::Concern

  module ClassMethods
    # TODO - not working ...
    def log(str)
      puts "\n\n////////////////////////////////\n"
      puts "#{str}\n"
      puts "////////////////////////////////\n\n"
    end
  end
end

ActiveRecord::Base.send(:include, ActiveRecordUtilities)
