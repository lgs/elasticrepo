module Elasticrepo
  class Indexer	
    #attr_reader :indexed

    def initialize(owner)
      @repos ||= Elasticrepo::Extractor.new(owner).repos
    end

    def import
      index = Tire::Index.new('repositories')
      # Create the index with proper mapping (if doesn not exist already
      #
      index.create :mappings => {
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
      import @repos
      # Refresh the index for immediate searching
      #
      refresh
    end # end import

    def search(sub_string)
      # search for a sub_string 
      #
      search = Tire::Search::Search.new('repositories')
      search.query  { string('description:*"#{sub_string}"*') }
      search.results
    end

    def update
      # Just refresh the index as is 
      #
      refresh
    end

    def delete
      # delete 'repositories' index
      # 
      Tire::Index.new('repositories').delete
    end
  end # end class
end # end module
