require "yajl"
require "tire"
require 'octokit'


module Elasticrepo 

  autoload :RepoSubset, "elasticrepo/repo_subset"
  autoload :Extractor, "elasticrepo/extractor"
  autoload :Indexer, "elasticrepo/indexer"
  autoload :Version, "elasticrepo/version"

  Tire::Configuration.url "http://localhost:9200"
  Tire::Configuration.logger 'elasticsearch.log', :level => 'debug'

  #class ElasticrepoError < StandardError
  #end

end
