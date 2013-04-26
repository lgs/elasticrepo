require "spec_helper"

describe Elasticrepo::Indexer do
  let(:repos) { Elasticrepo::Indexer.new("lapaty") }
  subject(:indexer) { repos.import }

  context "print Elasticrepo::Indexer instantiation for debugging purposes" do
    its("repos")                   { print "#{repos} \n \n" }
    its("repos.class")             { print "#{repos.class} \n \n" }
    its("repos.inspect")           { print "#{repos.inspect} \n \n" }

    its("repos.extracted")         { print "#{repos.extracted} \n \n" }
    its("repos.extracted.class")   { print "#{repos.extracted.class} \n \n" }
    its("repos.extracted.inspect") { print "#{repos.extracted.inspect} \n \n" }
  end

  context "print before instance import for debugging purposes" do 
    its("indexer.extracted") { print "indexer: #{indexer.extracted} \n \n" }
    its("indexer.extracted.class") { print "indexer.extracted.class: #{imported.class} \n \n" }
    its("indexer.extracted.inspect") { print "indexer.extracted.inspect: #{indexer.extracted.inspect} \n \n" }
  end

  #describe "#import" do
    #it { subject.to_json.should include(5392501,"cainlevy","photor") }
  #  its("imported") { print "imported #{imported} \n \n" }
  #end

#[{"id":5392501,"owner":"cainlevy","name":"photor","url":"https://api.github.com/repos/cainlevy/photor","description":"Photo Organizer (in Ruby)","created_at":"2012-08-12T22:26:08Z","pushed_at":"2013-02-19T03:11:10Z","organization":"User","full_name":"cainlevy/photor","language":"Ruby","updated_at":"2013-03-13T02:05:33Z"},{"id":612595,"owner":"aino","name":"galleria","url":"https://api.github.com/repos/aino/galleria","description":"The JavaScript Image Gallery","created_at":"2010-04-15T21:11:51Z","pushed_at":"2013-03-01T20:16:55Z","organization":"Organization","full_name":"aino/galleria","language":"JavaScript","updated_at":"2013-04-18T06:30:41Z"}]

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
