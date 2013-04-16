require "spec_helper"

  # API ref.: GET /users/:user/starred
  # http://developer.github.com/v3/repos/
  # https://github.com/pengwynn/octokit/blob/master/lib/octokit/client/users.rb

  describe Elasticrepo::Extractor do
  
      #let(:parsed) { Yajl::Parser.parse(fixture("repositories.json").read) }
      # let(:parsed) { Octokit.starred('lapaty') }
      # subject { Elasticrepo::Extractor.new(parsed) }

      subject { Elasticrepo::Extractor.new("lapaty").repositories }

      it { should be_a(Array) }
      its(:size) { should eq(2) }

  end

#---------------------------------------------------------------------------------

#---------------------------------------------------------------------------------
  #    it { parsed.should_not be_empty }

  #    specify { parsed.should exist }
  
  #    its([:id])  { should eq(5392501) }
  #    its([:id]) { should eq(612595) }
  #    its(:size) { should eq(2) }
  
  #    its "GET /users/:user/starred" subject.should eq starred_live 
  
  
