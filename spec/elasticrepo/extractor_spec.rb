require "spec_helper"

    # API ref.: GET /users/:user/starred
    # http://developer.github.com/v3/repos/
    # https://github.com/pengwynn/octokit/blob/master/lib/octokit/client/users.rb

    describe Elasticrepo::Extractor, :vcr => { :cassette_name => "v3/users/_get/lapaty/starred" } do

      subject(:extracted) { Elasticrepo::Extractor.new("lapaty") }

      describe "#new" do
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

        context "debugging specs print out" do
          it "print the content of running specs" do
            print "extracted.repos.class:                  #{extracted.repos.class} \n \n"        
            print "extracted.repos.inspect:                #{extracted.repos.inspect} \n \n"
            print "extracted.repos[0].id:                  #{extracted.repos[0].id} \n \n"
            print "extracted.repos[0].owner                #{extracted.repos[0].owner} \n \n"
          end
        end

        context "extract fields subset from each repo" do   
         its("repos[0]['id']")           { extracted.repos[0].id.should eq 5392501 }
         its("repos[0]['owner']")        { extracted.repos[0].owner.should eq "cainlevy" }
         its("repos[0]['url']")          { extracted.repos[0].url.should eq "https://api.github.com/repos/cainlevy/photor" }
         its("repos[0]['description']")  { extracted.repos[0].description.should eq "Photo Organizer (in Ruby)" }
         its("repos[0]['name']")         { extracted.repos[0].name.should eq "photor" }
         its("repos[0]['created_at']")   { extracted.repos[0].created_at.should eq "2012-08-12T22:26:08Z" }
         its("repos[0]['pushed_at']")    { extracted.repos[0].pushed_at.should eq "2013-02-19T03:11:10Z" }
         its("repos[0]['organization']") { extracted.repos[0].organization.should eq "User" }
         its("repos[0]['full_name']")    { extracted.repos[0].full_name.should eq "cainlevy/photor" }
         its("repos[0]['language']")     { extracted.repos[0].language.should eq "Ruby" }
         its("repos[0]['updated_at']")   { extracted.repos[0].updated_at.should eq "2013-03-13T02:05:33Z" }
        end

      end 

    end 
