module Elasticrepo
  class Indexer	

    def initialize owner
      extractor = Elasticrepo::Extractor.new(owner)
      @results  = extractor.extract 
    end

    def import
      Tire.index 'repository' do

      #its(:full_name) { should eq("twitter/bootstrap") }
         
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
        import @results
         
        # Refresh the index for immediate searching
        #
        refresh
      end
    end 
  
  end
end
