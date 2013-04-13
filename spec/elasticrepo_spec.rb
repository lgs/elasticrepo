require "spec_helper"

  # http://developer.github.com/v3/repos/
  # GET /repos/:owner/:repo

  describe Elasticrepo::RepoSubset do
    context "limited subset of fields" do 
      subject { Yajl::Parser.parse(fixture("repository.json").read) }
      its(:id) { should eq(2126244) }
      its(:owner) { should eq("twitter") }
      its(:name) { should eq("bootstrap") }
      its(:url) { should eq("https://api.github.com/users/twitter") }
      its(:description) { should eq("Sleek, intuitive, and powerful front-end framework for faster and easier web development.") }
      its(:created_at) { should eq("2011-07-29T21:19:00Z") }
      its(:pushed_at) { should eq("2013-04-13T03:56:36Z") }
      its(:organization) { should eq("twitter") }
      its(:full_name) { should eq("twitter/bootstrap") }
      its(:language) { should eq("JavaScript") }
      its(:updated_at) { should eq("2013-04-13T19:12:09Z") }
    end
  end


