$LOAD_PATH.unshift 'lib'
require "elasticrepo/version"

Gem::Specification.new do |s|
  s.name              = "elasticrepo"
  s.version           = Elasticrepo::VERSION
  s.date              = Time.now.strftime('%Y-%m-%d')
  s.summary           = "Feed me."
  s.homepage          = "http://github.com/lgs/elasticrepo"
  s.email             = "luca.soave@gmail.com"
  s.authors           = [ "Luca G. Soave" ]
  s.has_rdoc          = false

  s.files             = %w( README.md Rakefile LICENSE )
  s.files            += Dir.glob("lib/**/*")
  #s.files            += Dir.glob("bin/**/*")
  #s.files            += Dir.glob("man/**/*")
  #s.files            += Dir.glob("test/**/*")
  s.files            += Dir.glob("spec/**/*")

#  s.executables       = %w( elasticrepo )
  s.description       = <<desc
  Feed me.
desc
end
