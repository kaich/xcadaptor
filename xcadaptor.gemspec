# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xcadaptor/version'

Gem::Specification.new do |spec|
  spec.name          = "xcadaptor"
  spec.version       = Xcadaptor::VERSION
  spec.authors       = ["kaich"]
  spec.email         = ["chengkai1853@163.com"]
  spec.summary       = %q{adapt xcode project because of system update.}
  spec.description   = %q{adapt xcode project because of system update.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*.rb"] + %w{ bin/xcadaptor}
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib","bin"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "thor", "~> 0.19.1"
end
