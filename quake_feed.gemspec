# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'quake_feed/version'

Gem::Specification.new do |spec|
  spec.name          = "quake_feed"
  spec.version       = QuakeFeed::VERSION
  spec.authors       = ["Pat Farrell"]
  spec.email         = ["pfarrell@ulive.com"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "data_mapper"
  spec.add_dependency "dm-postgres-adapter"
  spec.add_dependency "sinatra"
  spec.add_dependency "sinatra-respond_to"
  spec.add_dependency "haml"
  spec.add_dependency "emk-sinatra-url-for"
  spec.add_dependency "activesupport"
  spec.add_dependency "dm-geokit"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "dm-sqlite-adapter"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "rack-test"
end
