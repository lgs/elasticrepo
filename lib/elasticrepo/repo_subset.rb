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
    
    def to_indexed_json
      self.to_json
    end

    # retourns json :
 
      # repos[0].to_indexed_json 
      # "[\"5392501\",\"cainlevy\",\"photor\",\"https://api.github.com/repos/cainlevy/photor\",\"Photo Organizer (in Ruby)\",\"2012-08-12T22:26:08Z\",\"2013-02-19T03:11:10Z\",\"User\",\"cainlevy/photor\",\"Ruby\",\"2013-03-13T02:05:33Z\"]"
     
      # repos[1].to_indexed_json
      # "[\"612595\",\"aino\",\"galleria\",\"https://api.github.com/repos/aino/galleria\",\"The JavaScript Image Gallery\",\"2010-04-15T21:11:51Z\",\"2013-03-01T20:16:55Z\",\"Organization\",\"aino/galleria\",\"JavaScript\",\"2013-04-25T15:27:54Z\"]"
  end
end