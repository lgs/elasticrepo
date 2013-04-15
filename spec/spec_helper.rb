$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require 'elasticrepo'
require 'octokit'
require 'yajl'

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

#require 'rspec'
#require 'webmock/rspec'
#Dir["./spec/support/**/*.rb"].each { |file| require file }
