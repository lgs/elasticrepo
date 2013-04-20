$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require 'fakeweb'
require 'elasticrepo'
require 'octokit'
require 'tire'
require 'yajl'

def fixture_path
  File.expand_path("../fixtures", __FILE__)
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
