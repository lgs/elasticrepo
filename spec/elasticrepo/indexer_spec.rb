require "spec_helper"

describe Elasticrepo::Indexer do
  let(:elastic_repo) { Elasticrepo::Indexer.new("lapaty") }  
  subject(:import) { elastic_repo.import }

  context "print Elasticrepo::import instantiation for debugging purposes" do
    its("elastic_repo")                   { print "#{elastic_repo} \n \n" }
    its("elastic_repo.class")             { print "#{elastic_repo.class} \n \n" }
    its("elastic_repo.inspect")           { print "#{elastic_repo.inspect} \n \n" }

    #its("elastic_repo.extracted")         { print "#{elastic_repo.extracted} \n \n" }
    #its("elastic_repo.extracted.class")   { print "#{elastic_repo.extracted.class} \n \n" }
    #its("elastic_repo.extracted.inspect") { print "#{elastic_repo.extracted.inspect} \n \n" }
  end

  context "print before instance import for debugging purposes" do 
    #its("import.extracted") { print "import: #{import.extracted} \n \n" }
    #its("import.extracted.class") { print "import.extracted.class: #{imported.class} \n \n" }
    #its("import.extracted.inspect") { print "import.extracted.inspect: #{import.extracted.inspect} \n \n" }
  end

  #describe "#import" do
    #it { subject.to_json.should include(5392501,"cainlevy","photor") }
  #  its("imported") { print "imported #{imported} \n \n" }
  #end

#[{"id":5392501,"owner":"cainlevy","name":"photor","url":"https://api.github.com/elastic_repo/cainlevy/photor","description":"Photo Organizer (in Ruby)","created_at":"2012-08-12T22:26:08Z","pushed_at":"2013-02-19T03:11:10Z","organization":"User","full_name":"cainlevy/photor","language":"Ruby","updated_at":"2013-03-13T02:05:33Z"},{"id":612595,"owner":"aino","name":"galleria","url":"https://api.github.com/elastic_repo/aino/galleria","description":"The JavaScript Image Gallery","created_at":"2010-04-15T21:11:51Z","pushed_at":"2013-03-01T20:16:55Z","organization":"Organization","full_name":"aino/galleria","language":"JavaScript","updated_at":"2013-04-18T06:30:41Z"}]

#  describe "GET index" do
#    it "assigns all reports as @reports" do
#     report = Report.create! valid_attributes
#     get :index, {}, valid_session
#     assigns(:reports).should include(report)
#    end
#  end

  describe "#search" do
    # see also: https://github.com/ferpetrelli/elasticsearch_tire_test
    subject { elastic_repo.delete }
    subject { import }
    let(:result) { elastic_repo.search("mage Gall") }

    context "Searching" do      
      its("match 'mage Gall' substring: ")  { print "#{result.inspect}" }

      it "find repo matching 'mage Gall' substring" do
        result.count.should == 1
      end
    end
  end

end

#      describe "users" do

#        it "should filter users by name" do
#          result = @elasticrepo.user_search(:name => "user")
#          result.count.should == 1
#          result.first.name.should == @user_1.name
#        end

#        it "should filter users by age" do
#          result = @elasticrepo.user_search(:age => 23)
#          result.count.should == 1
#          result.first.age.should == @user_2.age
#        end
#      end