module Elasticrepo
  class Indexer	
    attr_reader :extracted

    def initialize(owner)
      repos = Elasticrepo::Extractor.new(owner).repos
    end

    def import
      Tire.index 'repository' do
        # Create the index with proper mapping (if not exists already)
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
        import @extracted
         
        # Refresh the index for immediate searching
        #
        refresh
      end
    end 
  
  end
end
