require "spec_helper"

  # API ref.: GET /users/:user/starred
  # http://developer.github.com/v3/repos/
  # https://github.com/pengwynn/octokit/blob/master/lib/octokit/client/users.rb

  describe Elasticrepo::Extractor do
    let(:fixture_repos) { Yajl::Parser.parse(fixture("repositories.json").read) }

    # when online, works with "live" GitrHub V3 APIs ( uncomment following line )
    # subject(:live_repos)  { Elasticrepo::Extractor.new("lapaty").repositories }

    # when offline, works with local fixtures ( uncomment following line )
    subject(:live_repos) { fixture_repos }

    describe "#new" do 
      context "the list of repos is well formed" do

        # show var content while rspec'ing
        it "print" do
          print "fixture_repos: #{fixture_repos[1]["id"]} \n + \n +\n"
          print "live_repos: #{live_repos[1]["id"]} \n + \n +\n"
        end
  
        # check well forming data set
        it { fixture_repos.should be_a(Array) }
        it { live_repos.should be_a(Array) }
        it { fixture_repos.should_not be_empty }
        it { live_repos.should_not be_empty }
  
        # compare fixture to live API V3 
        its(:size)      { should eq(2) }
        its(["id"])     { "#{live_repos[1]['id']}".should eq("#{fixture_repos[1]['id']}") }
        its(["owner"])  { "#{live_repos[1]['id']}".should eq("#{fixture_repos[1]['id']}") }
        its(["name"])   { "#{live_repos[1]['id']}".should eq("#{fixture_repos[1]['id']}") }
      end # "the list of repos is well formed"
    end # describe "#new"

    describe "#extract" do 
      let(:subset) { live_repos.map!{|repo|Elasticrepo::RepoSubset.new(repo)} }

      context "get list of repos starred by user" do
        it "checks the source repository list" do
          print "\n live_repos: #{live_repos[0]} \n"
          print "\n live_repos: #{live_repos[1]} \n"

          print "\n live_repos: #{live_repos[0]['id']} \n"
          print "\n live_repos: #{live_repos[1]['id']} \n"
        end
        it "extracted fields" do
          print "\n ________  checks extracted fields  _______ \n"

          print "\n subset: #{subset.class} \n"
          print "\n subset: #{subset.size} \n"

          print "\n subset: #{subset[0].inspect} \n"
          print "\n subset: #{subset[1].inspect} \n"

          print "\n subset: #{subset[0].id} \n"
          print "\n subset: #{subset[1].id} \n"
        end
      end # "get list of repos starred by a user"
    end # describe "#extrac"

  end # describe Elasticrepo::Extractor

  
