# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'heroku_secrets/version'

Gem::Specification.new do |spec|
  spec.name          = "heroku_secrets"
  spec.version       = HerokuSecrets::VERSION
  spec.authors       = ["Alex Peattie"]
  spec.email         = ["alexpeattie@gmail.com"]
  spec.summary   = %q{Use secrets.yml with Heroku}
  spec.homepage      = "https://github.com/alexpeattie/heroku_secrets"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
