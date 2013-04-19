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
      context "get a list of two repos starred by user" do
        its(:size) { should eq(2) }
      end
      context "compare 'fixtures' with 'live github APIs'" do
        # check well forming data set
        it { fixture_repos.should be_a(Array) }
        it { live_repos.should be_a(Array) }
        it { fixture_repos.should_not be_empty }
        it { live_repos.should_not be_empty }
        # compare fixture to live API V3 
        its(["id"])     { "#{live_repos[1]['id']}".should eq("#{fixture_repos[1]['id']}") }
        its(["owner"])  { "#{live_repos[1]['id']}".should eq("#{fixture_repos[1]['id']}") }
        its(["name"])   { "#{live_repos[1]['id']}".should eq("#{fixture_repos[1]['id']}") }
      end # "the list of repos is well formed"
    end # describe "#new"

    describe "#extract" do 
      # fake #extract: 
      # subject(:subset) { live_repos.map!{|repo|Elasticrepo::RepoSubset.new(repo)} }

      subject(:subset) { Elasticrepo::Extractor.new("lapaty").extract }

      context "get list of repos starred by user" do
        #it "checks extracted fields" do
        #  print "\n subset: #{subset} \n"

        #  print "\n subset.class : #{subset.class} \n"
        #  print "\n subset.size : #{subset.size} \n"

        #  print "\n subset[1].inspect : #{subset[0].inspect} \n"
        #  print "\n subset[1].inspect : #{subset[1].inspect} \n"

        #  print "\n subset[0].id : #{subset[0].id} \n"
        #  print "\n subset[1].id : #{subset[1].id} \n"

        #  print "\n subset[0].owner : #{subset[0].owner} \n"
        #  print "\n subset[1].owner : #{subset[1].owner} \n"
        #end

        #it "show previous live_repos format" do
        #   print "\n #{live_repos[0]['owner']['login']} \n"        
        #   print "\n #{live_repos[1]['owner']['login']} \n"        
        #end

        its("checks extracted id field") { "#{live_repos[0]['id']}".should eq("#{subset[0].id}") }
        its("checks extracted id field") { "#{live_repos[1]['id']}".should eq("#{subset[1].id}") }

        its("checks extracted owner field") { "#{live_repos[0]['owner']['login']}".should eq("#{subset[0].owner}") }
        its("checks extracted owner field") { "#{live_repos[1]['owner']['login']}".should eq("#{subset[1].owner}") }

        its("checks extracted name field") { "#{live_repos[0]['name']}".should eq("#{subset[0].name}") }
        its("checks extracted name field") { "#{live_repos[1]['name']}".should eq("#{subset[1].name}") }

      end # "get list of repos starred by a user"
    end # describe "#extrac"

  end # describe Elasticrepo::Extractor

  
