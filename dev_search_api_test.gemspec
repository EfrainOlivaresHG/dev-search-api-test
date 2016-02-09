# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dev_search_api_test/version'

Gem::Specification.new do |spec|
  spec.name          = 'dev_search_api_test'
  spec.version       = DevSearchApiTest::VERSION
  spec.authors       = ['Efrain Olivares']
  spec.email         = ['efrain.olivares@hgdata.com']

  spec.summary       = 'Test repository for dev-search-api calls'
  spec.description   = 'Rspec run through api calls to test dev-search-api'
  spec.homepage      = 'hgdata.com'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.' unless spec.respond_to?(:metadata)

  spec.metadata['allowed_push_host'] = 'http://hgdata.com'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
