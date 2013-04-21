require "spec_helper"

describe Elasticrepo::Indexer do

  let(:repositories) { Elasticrepo::Extractor.new("lapaty") }
  subject(:subset) { repositories.extract }

  describe "#import" do
    subject(:indexer) { Elasticrepo::Indexer.new("lapaty").import }

    #it { print "repositories.inspect : #{repositories.inspect} \n" }
    it { print "subset.inspect : #{subset.inspect} \n" }

    it { print "indexer.inspect : #{indexer.inspect} \n" }
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
