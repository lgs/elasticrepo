require "spec_helper"

  # API ref.: GET /repos/:owner/:repo
  # http://developer.github.com/v3/repos/

  describe Elasticrepo::RepoSubset do

    before(:each) do
      VCR.use_cassette('v3/repos/_get/lgs/elasticrepo', :serialize_with => :json) do
        @parsed = Faraday.get('https://api.github.com/repos/lgs/elasticrepo')
      end
    end

    #let(:parsed) { Yajl::Parser.parse(fixture("repository.json").read) }
    subject { Elasticrepo::RepoSubset.new(@parsed) }

    context "checks the full repo subset of extracted fields"  do
      its(:id) { should eq(9416045) }
      its(:owner) { should eq("lgs") }
      its(:name) { should eq("elasticrepo") }
      its(:url){ should eq("https://api.github.com/repos/lgs/elasticrepo") }
      its(:description) { should eq("Indexing GitHub repository with ElasticSearch") }
      #its(:created_at) { should eq("2011-07-29T21:19:00Z") }
      #its(:pushed_at) { should eq("2013-04-13T03:56:36Z") }
      its(:organization) { should eq("User") }
      its(:full_name) { should eq("lgs/elasticrepo") }
      its(:language) { should eq("Ruby") }
      #its(:updated_at) { should eq("2013-04-13T19:12:09Z") }
    end
  end

#    describe "GET /repos/:owner/:repo" do
#      it 'gets "lgs/elasticrepo" repository (JSON)' do
#        VCR.use_cassette('v3/repos/#get/lgs/elasticrepo') do
#          response = Faraday.get 'https://api.github.com/repos/lgs/elasticrepo'
#          response.body.should include("1573")
#          response.body.should include("9416045")
#          response.body.should include("elasticrepo")
#          response.body.should include("lgs/elasticrepo")
#          response.body.should include("Indexing GitHub repository with ElasticSearch")
#        end
#      end
#    end
