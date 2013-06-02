require "spec_helper"

  # API ref.: GET /repos/:owner/:repo
  # http://developer.github.com/v3/repos/

  describe Elasticrepo::RepoSubset do

    let(:response) {
      VCR.use_cassette('v3/repos/#get/lgs/elasticrepo', :serialize_with => :json) do 
        Faraday.get('https://api.github.com/repos/lgs/elasticrepo').body
      end }

    describe "#new"  do
      subject { Elasticrepo::RepoSubset.new(response) }

      context "checks the full repo subset of extracted fields"  do
        #it { puts "response: #{response} \n \n" }
        it { response.should include("1573") } #owner id
        it { response.should_not include("1111") } #owner id

        it { response.should include("9416045") } #repo id
        it { response.should include("lgs") } #owner
        it { response.should include("elasticrepo") } #name
        it { response.should include("https://api.github.com/repos/lgs/elasticrepo") } #url
        it { response.should include("Indexing GitHub repository with ElasticSearch") } #description
        it { response.should include("lgs/elasticrepo") } #full_name
        it { response.should include("Ruby") } #language
      end
    end
  end

#      context "checks the full subset of extracted fields"  do
#        its(:id) { should eq(9416045) }
#        its(:owneryy) { should eq("lgs") }
#        its(:name) { should eq("elasticrepo") }
#        its(:url){ should eq("https://api.github.com/repos/lgs/elasticrepo") }
#        its(:description) { should eq("Indexing GitHub repository with ElasticSearch") }
        #its(:created_at) { should eq("2011-07-29T21:19:00Z") }
        #its(:pushed_at) { should eq("2013-04-13T03:56:36Z") }
        #its(:organization) { should eq("Organization") }
#        its(:full_name) { should eq("lgs/elasticrepo") }
#        its(:language) { should eq("Ruby") }
        #its(:updated_at) { should eq("2013-04-13T19:12:09Z") }
#      end
#    end

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
