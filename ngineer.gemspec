# -*- encoding: utf-8 -*-
$:.push File.join(File.dirname(__FILE__), 'lib')
require "ngineer/version"

Gem::Specification.new do |s|
  s.name        = "ngineer"
  s.version     = Ngineer::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Kevin Sylvestre"]
  s.email       = ["kevin@ksylvest.com"]
  s.homepage    = "http://github.com/ksylvest/ngineer"
  s.summary     = "A configuration and management tool for Rack applications using Nginx and Foreman."
  s.description = "A configuration and management tool for Rack applications using Nginx and Foreman."

  s.executables = ["ngineer"]

  s.files       = Dir["{bin,lib}/**/*"] + %w(LICENSE Rakefile README.rdoc)
  s.test_files  = Dir["spec/**/*"]

  s.add_dependency "commander"
  s.add_dependency "identifier"
  s.add_development_dependency "rspec"
  s.add_development_dependency "wirble"
end
