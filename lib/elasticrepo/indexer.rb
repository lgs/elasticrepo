module Elasticrepo
  class Indexer
#    attr_reader ...

    def initialize
    end

#    elapsed = Benchmark.realtime do
#      Tire.index 'repository' do
         
        # Create the index with proper mapping (if not exists already)
        #
        #create :mappings => {
        #  :question => {
        #    :properties => {
        #      :id => { :type => 'string', :analyzer => 'keyword' },
        #      :link => { :type => 'string', :analyzer => 'keyword' },
        #      :categories => { :type => 'string', :analyzer => 'keyword' },
        #      :author => { :type => 'string', :analyzer => 'keyword' },
        #      :title => { :type => 'string', :analyzer => 'snowball' },
        #      :summary => { :type => 'string', :analyzer => 'snowball' }
        #    }
        #  }
        #}
         
        # Import documents
#        import documents
         
        # Refresh the index for immediate searching
        #
#        refresh
#      end
#    end
  
  end
end
