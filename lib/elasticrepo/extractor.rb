module Elasticrepo
  class Extractor
    # explicit attr_accessor
    attr_reader :owner
    attr_writer :owner

    # ex: results = Elasticrepo::Extractor.starred_repos_by_user(owner = "lapaty")
    def self.starred_repos_by_user(owner)
      # GET /users/:user/starred 
      # ex: /users/lapaty/starred 
      # --> array of hashes
      parsed = Octokit.starred(owner)
      repositories = parsed.map do |item|
        RepoSubset.new(item)
      end
    end
  end
end

