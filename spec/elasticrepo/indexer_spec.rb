require "spec_helper"

describe Elasticrepo::Indexer do
  
  describe "#starred", :vcr => { :cassette_name => "v3/users/_get/lapaty/starred" }  do

    let(:indexer) { Elasticrepo::Indexer.new }  
    subject(:starred_import) { indexer.starred("lapaty") }

    context "print starred instance for debugging purposes" do 
      its("starred_import")         { print "starred_import: #{starred_import} \n \n" }
      its("starred_import.class")   { print "starred_import.class: #{starred_import.class} \n \n" }
      its("starred_import.inspect") { print "starred_import.inspect: #{starred_import.inspect} \n \n" }
    end

#    context "searching" do
#     # see also: https://github.com/ferpetrelli/elasticsearch_tire_test
#      subject { starred_import.delete }
#      subject { starred_import }
#      let(:search) { Tire::Search::Search.new("repositories") }

#      it "find one repo matching" do
#        search.query  { string('description:*mage Gall') }
#        search.results.count.should == 1
#      end

#      its("print search results: ") { print "#{search.results}" }
#    end
  end

end
