require "spec_helper"

describe Elasticrepo::Indexer do

   let(:indexer) { Elasticrepo::Indexer.new("lapaty") }

  describe "#import" do
    subject { indexer.import }

    it { print "indexer.inspect : #{indexer.inspect}" }
    it { print "indexer.results : #{indexer.results}" }
  end

#  describe "GET index" do
#    it "assigns all reports as @reports" do
#     report = Report.create! valid_attributes
#     get :index, {}, valid_session
#     assigns(:reports).should include(report)
#    end
#  end
end


#  describe "#search" do
#    before(:each) do
#      @elasticrepo = Elasticrepo::Indexer.tire.index.delete
#      @elasticrepo = Elasticrepo::Indexer.create_elasticsearch_index

#      @repo_1 = @elasticrepo.create({
#        :name => "test user",
#        :age => 25
#      })
#      @repo_2 = @elasticrepo.create({
#        :name => "another name in the spec",
#        :age => 23
#      })
#
#      @elasticrepo.all.each do |s|
#        s.tire.update_index
#      end
#      @elasticrepo.tire.index.refresh
#    end

#    context "Searching" do
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
#    end
#  end
#end

#--------------------------------------------------------------------------------
#    context "get list of repos starred by a user" do
#      describe "#new" do # Elasticrepo::Extractor.new("lapaty").repositories
#        let(:parsed )   { Yajl::Parser.parse(fixture("repositories.json").read) }
#        subject(:ockto_get) { Elasticrepo::Extractor.new("lapaty").repositories }
  
#        # just to show the content while rspec'ing
#        it "print" do
#          print "parsed: #{parsed[1]["id"]} \n + \n +\n"
#          print "ockto_get: #{ockto_get[1]["id"]} \n + \n +\n"
#        end
  
#        it { parsed.should be_a(Array) }
#        it { ockto_get.should be_a(Array) }
#        it { parsed.should_not be_empty }
#        it { ockto_get.should_not be_empty }
  
#        its(:size)      { should eq(2) }
#        its(["id"])     { "#{ockto_get[1]['id']}".should eq("#{parsed[1]['id']}") }
#        its(["owner"])  { "#{ockto_get[1]['id']}".should eq("#{parsed[1]['id']}") }
#        its(["name"])   { "#{ockto_get[1]['id']}".should eq("#{parsed[1]['id']}") }
#      end
#    end
