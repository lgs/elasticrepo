require "spec_helper"

  # API ref.: GET   /repos/:owner/:repo
  # http://developer.github.com/v3/repos/

  describe Elasticrepo::RepoSubset, :vcr => { :cassette_name => "v3/repos/_get/lgs/elasticrepo" } do

    let(:repo) { Faraday.get('https://api.github.com/repos/lgs/elasticrepo').body }
    let(:parsed) { Yajl::Parser.parse(repo) }
    subject { Elasticrepo::RepoSubset.new(parsed) }

    describe "#new" do
      context "checks the full repo subset of extracted fields"  do
        its(:id) { should     eq(9416045) }
        its(:id) { should_not eq(94160450) }

        its(:owner) { should     eq("lgs") }
        its(:owner) { should_not eq("l-g-s") }

        its(:name) { should eq("elasticrepo") }
        its(:url){ should eq("https://api.github.com/repos/lgs/elasticrepo") }
        its(:description) { should eq("Indexing GitHub repository with ElasticSearch") }

        its(:created_at) { should     eq("2013-04-13T15:57:03Z") }
        its(:created_at) { should_not eq("2013-05-13T15:57:03Z") }

        its(:pushed_at) { should     eq("2013-06-02T09:33:42Z") }
        its(:pushed_at) { should_not eq("2013-07-02T09:33:42Z") }

        its(:organization) { should eq("User") }
        its(:full_name) { should eq("lgs/elasticrepo") }
        its(:language) { should eq("Ruby") }

        its(:updated_at) { should eq("2013-06-02T09:33:42Z") }
        its(:updated_at) { should_not eq("2013-07-02T09:33:42Z") }
      end
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
