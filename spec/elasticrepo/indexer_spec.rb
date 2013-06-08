require "spec_helper"

describe Elasticrepo::Extractor, :vcr => { :cassette_name => "v3/users/_get/lapaty/starred" } do
#describe Elasticrepo::Indexer do

  let(:elastic_repo) { Elasticrepo::Indexer.new("lapaty") }  
  subject(:import) { elastic_repo.import }

  context "print Elasticrepo::import instantiation for debugging purposes" do
    its("elastic_repo")                   { print "#{elastic_repo} \n \n" }
    its("elastic_repo.class")             { print "#{elastic_repo.class} \n \n" }
    its("elastic_repo.inspect")           { print "#{elastic_repo.inspect} \n \n" }
  end

  context "print before instance import for debugging purposes" do 
    its("import") { print "import: #{import} \n \n" }
    its("import.class") { print "import.class: #{import.class} \n \n" }
    its("import.inspect") { print "import.inspect: #{import.inspect} \n \n" }
  end

#[{"id":5392501,"owner":"cainlevy","name":"photor","url":"https://api.github.com/elastic_repo/cainlevy/photor","description":"Photo Organizer (in Ruby)","created_at":"2012-08-12T22:26:08Z","pushed_at":"2013-02-19T03:11:10Z","organization":"User","full_name":"cainlevy/photor","language":"Ruby","updated_at":"2013-03-13T02:05:33Z"},{"id":612595,"owner":"aino","name":"galleria","url":"https://api.github.com/elastic_repo/aino/galleria","description":"The JavaScript Image Gallery","created_at":"2010-04-15T21:11:51Z","pushed_at":"2013-03-01T20:16:55Z","organization":"Organization","full_name":"aino/galleria","language":"JavaScript","updated_at":"2013-04-18T06:30:41Z"}]

#  describe "GET index" do
#    it "assigns all reports as @reports" do
#     report = Report.create! valid_attributes
#     get :index, {}, valid_session
#     assigns(:reports).should include(report)
#    end
#  end

  describe "#import" do
    context "searching" do
      # see also: https://github.com/ferpetrelli/elasticsearch_tire_test
      subject { elastic_repo.delete }
      subject { import }
      let(:search) { Tire::Search::Search.new("repositories") }

      it "find one repo matching" do
        search.query  { string('description:*mage Gall') }
        search.results.count.should == 1
      end

      its("print search results: ") { print "#{search.results}" }
    end
  end

end
