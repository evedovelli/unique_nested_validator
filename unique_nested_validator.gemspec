# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'unique_nested_validator/version'

Gem::Specification.new do |spec|
  spec.name          = "unique_nested_validator"
  spec.version       = UniqueNested::VERSION
  spec.authors       = ["Estevan Vedovelli"]
  spec.email         = ["evedovelli@gmail.com"]
  spec.description   = %q{This validator allows you to verify nested models created with nested forms to validate the uniqueness of an attribute, More details in http://github.com/evedovelli/unique_nested_validator}
  spec.summary       = %q{A validator for warranting the uniqueness of nested model attributes}
  spec.homepage      = "http://github.com/evedovelli/unique_nested_validator"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activemodel", ">= 0"
  spec.add_dependency "i18n"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
