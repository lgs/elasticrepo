require "spec_helper"

  # API ref.: GET /repos/:owner/:repo
  # http://developer.github.com/v3/repos/

  describe Elasticrepo::RepoSubset do
    let(:parsed) { Yajl::Parser.parse(fixture("repository.json").read) }
    subject { Elasticrepo::RepoSubset.new(parsed) }

    context "checks extracted fields"  do
      its(:id) { should eq(2126244) }
      its(:owner) { should eq("twitter") }
      its(:name) { should eq("bootstrap") }
      its(:url){ should eq("https://api.github.com/repos/twitter/bootstrap") }
      its(:description) { should eq("Sleek, intuitive, and powerful front-end framework for faster and easier web development.") }
      its(:created_at) { should eq("2011-07-29T21:19:00Z") }
      its(:pushed_at) { should eq("2013-04-13T03:56:36Z") }
      its(:organization) { should eq("Organization") }
      its(:full_name) { should eq("twitter/bootstrap") }
      its(:language) { should eq("JavaScript") }
      its(:updated_at) { should eq("2013-04-13T19:12:09Z") }
    end
  end


