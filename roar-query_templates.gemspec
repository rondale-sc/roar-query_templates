# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'roar/query_templates/version'

Gem::Specification.new do |spec|
  spec.name          = "roar-query_templates"
  spec.version       = Roar::QueryTemplates::VERSION
  spec.authors       = ["Travis Anderson", "Jonathan Jackson"]
  spec.email         = ["dev@hashrocket.com"]
  spec.description   = %q{Small extension that adds the ability to generate query templates within your roar representers}
  spec.summary       = %q{Small extension that adds the ability to generate query templates within your roar representers}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "roar"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
