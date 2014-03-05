# -*- encoding: utf-8 -*-
require File.expand_path('../lib/grape_bootstrap/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Mate Marjai"]
  gem.email         = ["mate.marjai@gmail.com"]
  gem.description   = %q{This library contains an executable to bootstrap and scaffold the minimum for a grape REST API.}
  gem.summary       = %q{Grape REST API bootstrap.}
  gem.homepage      = "https://github.com/marjaimate/grape-bootstrap"
  gem.license       = "MIT"

  gem.files         = [
    Dir.glob("lib/**/*.rb"),
    Dir.glob("lib/**/*.erb"),
    Dir.glob("bin/*"),
    ['grape-bootstrap.gemspec']
  ].inject(:+)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "grape_bootstrap"
  gem.require_paths = ["lib"]
  gem.version       = GrapeBootstrap::VERSION

  # Declare the gem dependecies
  gem.add_dependency('grape', '~> 0')
  gem.add_dependency('rake', '~> 0')
end
