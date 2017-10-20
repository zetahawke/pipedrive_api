# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pipedrive_api/version"

Gem::Specification.new do |spec|
  spec.name          = "pipedrive_api"
  spec.version       = PipedriveApi::VERSION
  spec.authors       = ["zetahawke"]
  spec.email         = ["michel.szinavel@gmail.com"]

  spec.summary       = %q{This is a wrap gem for consume pipedrive api}
  spec.description   = %q{Pipedrive api rest client for consume this service on a wrap gem}
  spec.homepage      = "https://github.com/zetahawke/pipedrive_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "pry-byebug"
  spec.add_dependency "faraday", '~> 0.9'
  spec.add_dependency "uri_template", '~> 0.7'
  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
