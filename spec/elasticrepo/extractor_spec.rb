require "spec_helper"
  # API ref.: GET /users/:user/starred
  # http://developer.github.com/v3/repos/
  # https://github.com/pengwynn/octokit/blob/master/lib/octokit/client/users.rb

  describe Elasticrepo::Extractor do
    let(:fixture_repos)  { Yajl::Parser.parse(fixture("repositories.json").read) }
    #let(:live_extracted) { Elasticrepo::Extractor.new("lapaty") }
    

    context "GET /users/:user/starred" do
      describe "#extract" do 
        
        context "debugging purposes" do
          it "print the content of running specs" do
            #print "live_extracted.repos:            #{live_extracted.repos} \n \n" 
            #print "live_extracted.repos.class:      #{live_extracted.repos.class} \n \n"
            #print "live_extracted.repos.to_json: #{live_extracted.repos.to_json} \n \n"
            #print "live_extracted.repos[0].to_json: #{live_extracted.repos[0].to_json} \n \n"
            #print "live_extracted.repos[0].owner:      #{live_extracted.repos[0].owner} \n \n"
            #print "live_extracted.repos[0].organization:      #{live_extracted.repos[0].organization} \n \n"
  
            #print "fixture_repos:                   #{fixture_repos} \n \n"
            #print "fixture_repos.class:             #{fixture_repos.class} \n \n"
            #print "fixture_repos.to_json:                #{fixture_repos[0].to_json} \n \n"
            #print "fixture_repos[0].to_json:                #{fixture_repos[0].to_json} \n \n"
            #print "fixture_repos[0]['owner']['login']:          #{fixture_repos[0]['owner']['login']} \n \n"
            #print "fixture_repos[0]['organization']:          #{fixture_repos[0]['organization']} \n \n"
          end

          it "is an arry of hashes" do
#            fixture = %w[{"id":5392501,"owner":"cainlevy","name":"photor","url":"https://api.github.com/repos/cainlevy/photor","description":"Photo Organizer (in Ruby)","created_at":"2012-08-12T22:26:08Z","pushed_at":"2013-02-19T03:11:10Z","organization":"User","full_name":"cainlevy/photor","language":"Ruby","updated_at":"2013-03-13T02:05:33Z"},{"id":612595,"owner":"aino","name":"galleria","url":"https://api.github.com/repos/aino/galleria","description":"The JavaScript Image Gallery","created_at":"2010-04-15T21:11:51Z","pushed_at":"2013-03-01T20:16:55Z","organization":"Organization","full_name":"aino/galleria","language":"JavaScript","updated_at":"2013-04-18T06:30:41Z"}]
#            live_extracted.repos.to_json.should eq fixture
          end
        end

#        context "extract fields subset from each repo" do
#          its("fixture_repos[0]['id']") { fixture_repos[0]['id'].should eq live_extracted.repos[0].id }
#          #its("fixture_repos[0]['owner']['login']") { fixture_repos[0]['owner']['login'].should eq live_extracted.repos[0].owner['login'] }
#          its("fixture_repos[0]['name']") { fixture_repos[0]['name'].should eq live_extracted.repos[0].name }
#          its("fixture_repos[0]['url']") { fixture_repos[0]['url'].should eq live_extracted.repos[0].url }
#          its("fixture_repos[0]['description']") { fixture_repos[0]['description'].should eq live_extracted.repos[0].description }
#          its("fixture_repos[0]['created_at']") { fixture_repos[0]['created_at'].should eq live_extracted.repos[0].created_at }
#          its("fixture_repos[0]['pushed_at']") { fixture_repos[0]['pushed_at'].should eq live_extracted.repos[0].pushed_at }
#          #its("fixture_repos[0]['organization']") { fixture_repos[0]['organization'].should eq live_extracted.repos[0].organization }
#          its("fixture_repos[0]['full_name']") { fixture_repos[0]['full_name'].should eq live_extracted.repos[0].full_name }
#          its("fixture_repos[0]['language']") { fixture_repos[0]['language'].should eq live_extracted.repos[0].language }
#          #its("fixture_repos[0]['updated_at']") { fixture_repos[0]['updated_at'].should eq live_extracted.repos[0].updated_at }

#          its("fixture_repos[1]['id']") { fixture_repos[1]['id'].should eq live_extracted.repos[1].id }
#          #its("fixture_repos[1]['owner']['login']") { fixture_repos[1]['owner']['login'].should eq live_extracted.repos[1].owner['login'] }
#          its("fixture_repos[1]['name']") { fixture_repos[1]['name'].should eq live_extracted.repos[1].name }
#          its("fixture_repos[1]['url']") { fixture_repos[1]['url'].should eq live_extracted.repos[1].url }
#          its("fixture_repos[1]['description']") { fixture_repos[1]['description'].should eq live_extracted.repos[1].description }
#          its("fixture_repos[1]['created_at']") { fixture_repos[1]['created_at'].should eq live_extracted.repos[1].created_at }
#          its("fixture_repos[1]['pushed_at']") { fixture_repos[1]['pushed_at'].should eq live_extracted.repos[1].pushed_at }
#          #its("fixture_repos[1]['organization']") { fixture_repos[1]['organization'].should eq live_extracted.repos[1].organization }
#          its("fixture_repos[1]['full_name']") { fixture_repos[1]['full_name'].should eq live_extracted.repos[1].full_name }
#          its("fixture_repos[1]['language']") { fixture_repos[1]['language'].should eq live_extracted.repos[1].language }
#          #its("fixture_repos[1]['updated_at']") { fixture_repos[1]['updated_at'].should eq live_extracted.repos[1].updated_at }
#        end

      end 
    end 

  end 

  
