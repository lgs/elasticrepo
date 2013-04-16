require "elasticrepo/version"
require "yajl"

module Elasticrepo 

  autoload :RepoSubset, "elasticrepo/repo_subset"
  autoload :Extractor, "elasticrepo/extractor"
  autoload :Indexer, "elasticrepo/indexer"

  #class ElasticrepoError < StandardError
  #end

end
