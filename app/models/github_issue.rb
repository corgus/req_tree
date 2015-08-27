class GithubIssue < ActiveRecord::Base
  extend Enumerizable
  include Searchable

  enumerize :repository, in: ['sw', 'bd-sw']
end
