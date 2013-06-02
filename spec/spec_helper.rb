$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require 'elasticrepo'
require 'faraday'
require 'octokit'
require 'tire'
require 'yajl'
require 'vcr'

VCR.configure do |c|  
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :faraday # or webmock, fakeweb
  #c.default_cassette_options = { :serialize_with => :json  }
end

#VCR.use_cassette('v3/repos/_get/lgs/elasticrepo', :serialize_with => :json) do
#  Faraday.get('https://api.github.com/repos/lgs/elasticrepo')
#end 

def fixture_path
  #File.expand_path("../fixtures", __FILE__)
  File.expand_path("../vcr_cassettes/v3/repos/_get/lgs", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

#require 'rspec'
#Dir["./spec/support/**/*.rb"].each { |file| require file }

#RSpec.configure do |config|
#  config.before :each do
#    FakeWeb.allow_net_connect = false
#    FakeWeb.register_uri(:any, %r|\Ahttp://localhost:9200|, :body => "{}")
#    # http://stackoverflow.com/questions/10403951/elasticsearch-tire-good-strategy-to-mock-es
#  end
#end
