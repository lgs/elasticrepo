require "spec_helper"
  # API ref.: GET /users/:user/starred
  # http://developer.github.com/v3/repos/
  # https://github.com/pengwynn/octokit/blob/master/lib/octokit/client/users.rb

  describe Elasticrepo::Extractor do
    let(:fixture_repos)  { Yajl::Parser.parse(fixture("repositories.json").read) }
    let(:live_extracted) { Elasticrepo::Extractor.new("lapaty") }

    context "GET /users/:user/starred" do
      describe "#extract" do 
        
        context "extract fields subset from each repo" do
          it "print for debugging purposes" do
            #print "live_extracted.repos:            #{live_extracted.repos} \n \n" 
            print "live_extracted.repos.class:      #{live_extracted.repos.class} \n \n"
            print "live_extracted.repos[0].to_json: #{live_extracted.repos.to_json} \n \n"
  
            #print "fixture_repos:              #{fixture_repos} \n \n"
            print "fixture_repos.class:        #{fixture_repos.class} \n \n"
            print "fixture_repos[0]:           #{fixture_repos[0]} \n \n"
          end

#          its("fixture_repos[0]") { fixture_repos[0].should include live_extracted.repos[0].to_json }
#          its("fixture_repos[1]") { fixture_repos[1].should include live_extracted.repos[1].to_json }
        end

      end 
    end 

  end 

  
