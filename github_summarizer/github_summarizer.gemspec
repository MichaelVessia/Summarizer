# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require File.expand_path('../lib/github_summarizer/version', __FILE__)


Gem::Specification.new do |spec|
  spec.name          = "github_summarizer"
  spec.version       = GithubSummarizer::VERSION
  spec.authors       = ["Michael Vessia"]
  spec.email         = ["michaelvessia@mail.adelphi.edu"]

  spec.summary       = %q{Print a quick summary of a GitHub user.}
  spec.homepage      = "https://github.com/MichaelVessia/Summarizer.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($\)
  spec.executables   = ["github_summarizer"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "github_api"
  spec.add_development_dependency "colorize"

  spec.add_runtime_dependency "github_api"
  spec.add_runtime_dependency "colorize"
end
