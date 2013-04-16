module Elasticrepo
  class Extractor
    attr_reader :repositories

    # GET /users/:user/starred 
    # ex: /users/lapaty/starred --> array of hashes
    # ex: results = Elasticrepo::Extractor.new(owner = "lapaty")

    def initialize(owner)
      @owner = owner
      parsed = Octokit.starred(@owner)
      @repositories = parsed.map do |item|
        RepoSubset.new(item)
      end
    end
  end
end

