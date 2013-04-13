module Elasticrepo 
  API_BASE = "api.github.com"
  autoload :RepoSubset, "elasticrepo/repo_subset"

  class ElasticrepoError < StandardError
  end
end
