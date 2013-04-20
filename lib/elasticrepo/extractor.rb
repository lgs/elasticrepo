module Elasticrepo
  class Extractor

    # GET /users/:user/starred 
    # ex: /users/lapaty/starred --> array of hashes

    # ex:
    #     results = Elasticrepo::Extractor.new("lapaty")
    #     results.extract

    def initialize(owner)
      @repos = Octokit.starred(owner)
    end

    def extract
      @repos.map!{|repo|Elasticrepo::RepoSubset.new(repo)}
    end
  end
end

