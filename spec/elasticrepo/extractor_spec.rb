require "spec_helper"

# API ref.: GET /users/:user/starred
# http://developer.github.com/v3/repos/
# https://github.com/pengwynn/octokit/blob/master/lib/octokit/client/users.rb
#
describe Elasticrepo::Extractor, :vcr => { :cassette_name => "v3/users/_get/lapaty/starred" } do
  subject(:extracted) { Elasticrepo::Extractor.repos("lapaty") }

  describe "#new" do
    context "debugging specs print out" do
      it "print the content of running specs" do
        print "extracted.class:                  #{extracted.class} \n \n"        
        print "extracted.inspect:                #{extracted.inspect} \n \n"
        print "extracted[0].id:                  #{extracted[0].id} \n \n"
        print "extracted[0].owner                #{extracted[0].owner} \n \n"
      end
    end
    context "extract fields subset from each repo" do   
     its(:id)           { extracted[0].id.should eq 5392501 }
     its(:owner)        { extracted[0].owner.should eq "cainlevy" }
     its(:url)          { extracted[0].url.should eq "https://api.github.com/repos/cainlevy/photor" }
     its(:description)  { extracted[0].description.should eq "Photo Organizer (in Ruby)" }
     its(:name)         { extracted[0].name.should eq "photor" }
     its(:created_at)   { extracted[0].created_at.should eq "2012-08-12T22:26:08Z" }
     its(:pushed_at)    { extracted[0].pushed_at.should eq "2013-02-19T03:11:10Z" }
     its(:organization) { extracted[0].organization.should eq "User" }
     its(:full_name)    { extracted[0].full_name.should eq "cainlevy/photor" }
     its(:language)     { extracted[0].language.should eq "Ruby" }
     its(:updated_at)   { extracted[0].updated_at.should eq "2013-03-13T02:05:33Z" }
    end
  end 

end 
