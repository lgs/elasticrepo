module Elasticrepo
  module Indexer	
    INDEX = 'repositories'
    #def initialize
    #  @idx = "repositories"
    #end
    
    # given a user, extract his starred repositories, then index the list with Tire
    #
    # GET /users/:user/starred
    # http://developer.github.com/v3/repos/#list-user-repositories
    #
    def self.starred(owner)
      repos = Elasticrepo::Extractor.new(owner).repos
      # index the extraction
      #
      Tire::Index.new(INDEX) do
        # Import documents
        #
        import repos
        # Refresh the index for immediate searching
        #
        refresh
      end 
    end 

    def import_with_map
      repos = Elasticrepo::Extractor.new(@owner).repos
      Tire::Index.new(INDEX) do 
        # Create the index with proper mapping (if doesn not exist already)
        #
        create :mappings => {
          :question => {
            :properties => {
              :id => { :type => 'integer', :analyzer => 'keyword' },
              :owner => { :type => 'string', :analyzer => 'keyword' },
              :name => { :type => 'string', :analyzer => 'keyword' },
              #:full_name => { :type => 'string', :analyzer => 'keyword' },
              :url => { :type => 'string', :analyzer => 'snowball' },
              :description => { :type => 'string', :analyzer => 'snowball' },
              :organization => { :type => 'string', :analyzer => 'keyword' },
              :language => { :type => 'string', :analyzer => 'keyword' },
              :created_at => { :type => 'date', :analyzer => 'keyword' },
              :pushed_at => { :type => 'date', :analyzer => 'keyword' },
              :updated_at => { :type => 'date', :analyzer => 'keyword' }
            }
          }
        }  
        import repos
        refresh
      end
    end # end import

    def update
      # Just refresh the index as is 
      #
      Tire::Index.new(INDEX).refresh
    end

    def delete
      # delete 'repositories' index
      #
      Tire::Index.new(INDEX).delete
    end
  end # end class
end # end module
