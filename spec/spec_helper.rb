$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require 'elasticrepo'
require 'faraday'
require 'octokit'
require 'tire'
require 'yajl'
require 'vcr'

VCR.configure do |c|  
  c.configure_rspec_metadata!
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :faraday 
  c.default_cassette_options = { :serialize_with => :json  }
  #c.ignore_request do |request|
  #  URI(request.uri).uri == 'https://api.github.com/users/lapaty/starred'
  #end
end

RSpec.configure do |c|
  # so we can use `:vcr` rather than `:vcr => true`;
  # in RSpec 3 this will no longer be necessary.
  c.treat_symbols_as_metadata_keys_with_true_values = true
end

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
