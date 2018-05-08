# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omniauth/xero/version"

Gem::Specification.new do |spec|
  spec.name          = "omniauth-xero"
  spec.version       = Omniauth::Xero::VERSION
  spec.authors       = ["Kale Worsley"]
  spec.email         = ["kale@worsley.co.nz"]
  spec.description   = "Xero authentication strategy for OmniAuth."
  spec.summary       = "Xero authentication strategy for OmniAuth."
  spec.homepage      = "http://github.com/kaleworsley/omniauth-xero"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "omniauth-oauth", "~> 1.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0"
end
