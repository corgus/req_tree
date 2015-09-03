class GithubIssue < ReqTree::Base
  extend Enumerize
  include Searchable

  enumerize :repository, in: ['sw', 'bd-sw'], default: 'sw'
end
