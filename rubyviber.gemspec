# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubyviber/version'

Gem::Specification.new do |spec|
  spec.name          = "rubyviber"
  spec.version       = Rubyviber::VERSION
  spec.authors       = ["Andrey Viktorov"]
  spec.email         = ["andv@outlook.com"]

  spec.summary       = %q{Rubyviber is a small Faraday-based library to communicate with Viber Bots REST API}
  spec.homepage      = "https://github.com/4ndv/rubyviber"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", [">= 0.10", "< 2.0"]
  spec.add_dependency "faraday_middleware", [">= 0.10", "< 2.0"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end
