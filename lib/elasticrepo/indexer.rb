module Elasticrepo
  class Indexer	

    def initialize(owner)
      @owner = owner
      @idx = "repositories"
    end

    def import
      repos = Elasticrepo::Extractor.new(@owner).repos
      index = Tire::Index.new(@idx) do
        import repos
        refresh
      end
    end 

    def import_with_map
      # extract subset fields by user repositories starred list  
      # GET /users/:user/starred 
      #
      repos = Elasticrepo::Extractor.new(@owner).repos

      # index the extraction
      #
      @index = Tire::Index.new(@idx) do 
        # Create the index with proper mapping (if doesn not exist already
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
        # Import documents
        #
        import repos
        # Refresh the index for immediate searching
        #
        refresh
      end
    end # end import

    def update
      # Just refresh the index as is 
      #
      @index.refresh
    end

    def delete
      # delete 'repositories' index
      #
      @index.delete
    end
  end # end class
end # end module
