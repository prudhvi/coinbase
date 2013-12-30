# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coinbase/version'

Gem::Specification.new do |gem|
  gem.name          = "coinbase"
  gem.version       = Coinbase::VERSION
  gem.authors       = ["prudhvi"]
  gem.email         = ["prudhvi.d123@gmail.com"]
  gem.description   = %q{Coinbase Ruby OAuth2 client}
  gem.summary       = %q{Coinbase Ruby OAuth2 client}
  gem.homepage      = ""
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "bundler", "~> 1.3"
  gem.add_development_dependency "rake"
  gem.add_dependency 'faraday'
  gem.add_dependency 'faraday_middleware'
  gem.add_dependency 'hashie'
end
