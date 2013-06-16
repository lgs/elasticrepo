require "spec_helper"

describe Elasticrepo::Indexer, :vcr => { :cassette_name => "v3/users/_get/lapaty/starred" } do

  subject(:starred_import) { Elasticrepo::Indexer.starred("lapaty") }
  
  describe "#starred" do
    context "print starred_import instance for debugging purposes" do 
      its("starred_import")         { print "starred_import: #{starred_import} \n \n" }
      its("starred_import.class")   { print "starred_import.class: #{starred_import.class} \n \n" }
      its("starred_import.inspect") { print "starred_import.inspect: #{starred_import.inspect} \n \n" }
    end
    context "searching with Tire" do
      # see also: https://github.com/ferpetrelli/elasticsearch_tire_test
      let(:search) { Tire::Search::Search.new("repositories") }
      it "find one repo matching 'Image  Gall' description" do
        search.query  { string('description:*mage Gall') }
        search.results.count.should == 1
      end
      its("print search results: ") { print "#{search.results.inspect}" }
    end
  end
    
  # this test doesn't work
  #
  #describe "#delete" do
  #  subject { starred_import.delete }
    # see also: https://github.com/ferpetrelli/elasticsearch_tire_test
  #  let(:search) { Tire::Search::Search.new("repositories") }
    # subject { starred_import }
  #  it "cannot find a repo matching 'Image  Gall' description anymore" do
  #    search.query  { string('description:*mage Gall') }
  #    search.results.count.should == 1
  #  end
  #end
end
