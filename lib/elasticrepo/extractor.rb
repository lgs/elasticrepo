module Elasticrepo
  class Extractor
    attr_reader :repos

    # GET /users/:user/starred 
    # extract fields subset from each repo
    # then get back an array of lighter repos 

    def initialize owner 
      repos = Octokit.starred owner 
      @repos = repos.map!{|repo|Elasticrepo::RepoSubset.new(repo)}
    end
  end
end

