module Elasticrepo
  module Extractor
    #attr_reader :repos

    # GET /users/:user/starred --> Octokit.starred owner
    # extract fields subset from each repo --> Elasticrepo::RepoSubset
    # then returns an array of lighter repositories --> starred_list_by
    #
    def self.repos owner 
      repos = Octokit.starred owner 
      @repos = repos.map!{|repo|Elasticrepo::RepoSubset.new(repo)}
    end
  end
end