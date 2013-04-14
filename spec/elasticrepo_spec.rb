require "spec_helper"

  # API ref.: GET /repos/:owner/:repo
  # http://developer.github.com/v3/repos/

  describe Elasticrepo::RepoSubset do
    #context "read a full repository extracting the field :" do
    context "extract a subset of repository fields" do
      let(:parsed) { Yajl::Parser.parse(fixture("repository.json").read) }
      subject { Elasticrepo::RepoSubset.new(parsed) }

      context "#id" do
        its(:id) { should eq(2126244) }
      end
      context "#owner" do
        its(:owner) { should eq("twitter") }
      end
      context "#name" do
        its(:name) { should eq("bootstrap") }
      end
      context "#url" do
        its(:url) { should eq("https://api.github.com/repos/twitter/bootstrap") }
      end
      context "#description" do
        its(:description) { should eq("Sleek, intuitive, and powerful front-end framework for faster and easier web development.") }
      end
      context "#created_at" do
        its(:created_at) { should eq("2011-07-29T21:19:00Z") }
      end
      context "#pushed_at" do 
        its(:pushed_at) { should eq("2013-04-13T03:56:36Z") }
      end
      context "#organization" do
        its(:organization) { should eq("Organization") }
      end
      context "#full_name" do
        its(:full_name) { should eq("twitter/bootstrap") }
      end
      context "#language" do
        its(:language) { should eq("JavaScript") }
      end
      context "#updated_at" do
        its(:updated_at) { should eq("2013-04-13T19:12:09Z") }
      end
    end
  end


