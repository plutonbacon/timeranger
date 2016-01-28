# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'timeranger/version'

Gem::Specification.new do |spec|
  spec.name          = 'timeranger'
  spec.version       = TimeRanger::VERSION
  spec.authors       = ['Michael Pellon']
  spec.email         = ['plutonbacon@dynosoft.org']
  spec.summary       = 'A collection of utilities for native time series modeling and analysis in Ruby.'
  spec.description   = 'A collection of utilities for native time series modeling and analysis in Ruby.'
  spec.homepage      = 'https://github.com/plutonbacon/timeranger.git'
  spec.license       = 'ISC'

  spec.required_ruby_version = '>= 2.0.0'

  spec.files = Dir['lib/**/*'] + %w( README.md LICENSE )

  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # Development only
  spec.add_development_dependency 'bundler', '~> 1.11.2'
  spec.add_development_dependency 'rake',    '~> 10.5.0'
  spec.add_development_dependency 'rspec',   '~> 3.4.0'
  spec.add_development_dependency 'pry',     '~> 0.10.3'
  spec.add_development_dependency 'yard',    '~> 0.8.7.6'
  spec.add_development_dependency 'rubocop', '~> 0.36.0'
end
