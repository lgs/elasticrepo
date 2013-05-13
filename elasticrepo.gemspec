$LOAD_PATH.unshift 'lib'
require "elasticrepo/version"

Gem::Specification.new do |s|
  s.name              = "elasticrepo"
  s.version           = Elasticrepo::VERSION
  s.date              = Time.now.strftime('%Y-%m-%d')

  s.summary           = "Index GitHub repositories with ElasticSearch."
  s.description       = "Index a list of 'starred' repositories per user."

  s.author            = "Luca G. Soave" 
  s.email             = "luca.soave@gmail.com"
  s.homepage          = "http://github.com/lgs/elasticrepo"

  s.add_dependency      'yajl-ruby',   '~> 1.1.0'
  s.add_dependency      'octokit',     '~> 1.24.0'
  s.add_dependency      'tire',     '~> 0.5.7'

  s.has_rdoc          = false

  #s.files             = %w( README.md Rakefile LICENSE )

  s.files            += Dir.glob("lib/**/*")
  #s.files            += Dir.glob("bin/**/*")
  #s.files            += Dir.glob("man/**/*")
  #s.files            += Dir.glob("test/**/*")
  s.files            += Dir.glob("spec/**/*")

  #  s.executables       = %w( elasticrepo )
end
