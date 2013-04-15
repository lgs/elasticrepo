require "spec_helper"

describe Elasticrepo::Extractor do

  describe ".starred_repos_by_user" do
    #let(:starred_live) {  Octokit.starred('lapaty') }
    subject {  Octokit.starred('lapaty') }
#    its(:size) { should eq(3) }

    # https://github.com/pengwynn/octokit/blob/master/lib/octokit/client/users.rb
    # GET /users/:user/starred
    let(:parsed) { Yajl::Parser.parse(fixture("repositories.json").read) }
    subject { Elasticrepo::Extractor.starred_repos_by_user(parsed) }

#    its([:id])  { should eq(5392501) }
#    its([:id]) { should eq(612595) }
#    its(:size) { should eq(2) }

    its "GET /users/:user/starred" subject.should eq starred_live 
  end

end

