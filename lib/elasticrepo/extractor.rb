module Elasticrepo
  class Extractor
    attr_reader :repositories

    # GET /users/:user/starred 
    # ex: /users/lapaty/starred --> array of hashes
    # ex: results = Elasticrepo::Extractor.new(owner = "lapaty")

    def initialize(owner)
      @repositories = Octokit.starred(owner)
    end

    # old:

    ## ex: results = RepoExtractor.starred_repos_by_user(github_repo = "https://api.github.com/users/lapaty/starred")
    #def self.starred_repos_by_user(github_repo)
    #  # GET /users/:user/starred
    #  # ex: /users/lapaty/starred --> array of hashes
    #  parsed = Yajl::Parser.parse(open(github_repo).read)
    #  repositories = parsed.map do |item|
    #    Repository.new(item)
    #  end
    #end

  end
end

