module Elasticrepo
  class RepoSubset
    attr_reader :id, :owner, :name, :url, :description, :created_at, :pushed_at,
                :organization, :full_name, :language, :updated_at
    def initialize(attributes)
      @id = attributes["id"]
      @owner = attributes["owner"]["login"]
      @name = attributes["name"]
      @url = attributes["url"]
      @description = attributes["description"]
      @created_at = attributes["created_at"]
      @pushed_at = attributes["pushed_at"]
      @organization = attributes["owner"]["type"]
      @full_name = attributes["full_name"]
      @language = attributes["language"]
      @updated_at = attributes["updated_at"]
    end
  end
end
