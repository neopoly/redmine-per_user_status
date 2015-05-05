# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "per_user_status/version"
require "per_user_status/infos"

Gem::Specification.new do |spec|
  spec.name          = "redmine-per_user_status"
  spec.version       = PerUserStatus::VERSION
  spec.authors       = PerUserStatus::Infos::AUTHORS.keys
  spec.email         = PerUserStatus::Infos::AUTHORS.values
  spec.summary       = PerUserStatus::Infos::DESCRIPTION
  spec.description   = PerUserStatus::Infos::DESCRIPTION
  spec.homepage      = PerUserStatus::Infos::URL
  spec.license       = PerUserStatus::Infos::LICENSE

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin\/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)\/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "~> 4.2.0"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rubocop"
end
