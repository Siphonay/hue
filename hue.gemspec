# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hue/version'

Gem::Specification.new do |spec|
  spec.name          = 'hue'
  spec.version       = Hue::VERSION
  spec.authors       = ['Sam Soffes']
  spec.email         = ['sam@soff.es']
  spec.description   = 'Work with Philips Hue light bulbs.'
  spec.summary       = 'Work with Philips Hue light bulbs from Ruby.'
  spec.homepage      = 'https://github.com/soffes/hue'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.1.0'
  spec.add_dependency 'thor'
  spec.add_dependency 'json'
  spec.add_dependency('color', '>= 1.4.1')
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'webmock'
end
