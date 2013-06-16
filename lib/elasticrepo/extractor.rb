module Elasticrepo
  module Extractor

    # GET /users/:user/starred --> Octokit.starred owner
    # extract fields subset from each repo --> Elasticrepo::RepoSubset
    # then returns an array of lighter starred repositories by user --> .repos
    #
    def self.repos owner 
      repos = Octokit.starred owner 
      @repos = repos.map!{|repo|Elasticrepo::RepoSubset.new(repo)}
    end
  end
end