# frozen_string_literal: true

version = File.read(File.expand_path("VERSION", __dir__)).strip

Gem::Specification.new do |s|
  s.name        = "ghost_train"
  s.version     = version
  s.summary     = "All aboard!"
  s.description = "I could've just used a ghost train."
  s.authors     = ["Thomas Hutterer"]
  s.email       = "tohu@tuta.io"
  s.homepage    = "https://rubygems.org/gems/ghost_train"
  s.license     = "MIT"

  s.executables += ["ghost", "train"]
  s.files       = Dir["lib/**/*"]

  s.metadata = {
    "bug_tracker_uri"   => "https://github.com/thutterer/ghost_train/issues",
    "changelog_uri"     => "https://github.com/thutterer/ghost_train/releases/tag/v#{version}",
    "documentation_uri" => "https://github.com/thutterer/ghost_train/tree/v#{version}/README.md",
    "source_code_uri"   => "https://github.com/thutterer/ghost_train/tree/v#{version}",
  }

  s.add_runtime_dependency "rails", "~> 6.1"
  s.add_runtime_dependency "puma", "~> 5.2"
  s.add_runtime_dependency "bootsnap", "~> 1.4", ">= 1.4.2"
  s.add_runtime_dependency "pg", "~> 1.2"
  s.add_runtime_dependency "sass-rails", "~> 6.0"
  s.add_runtime_dependency "devise", "~> 4.7"
  s.add_runtime_dependency "hotwire-rails"
  s.add_runtime_dependency "administrate"
  s.add_runtime_dependency "pundit", "~> 2.1"
  s.add_runtime_dependency "ahoy_matey", "~> 3.0"
  s.add_runtime_dependency "blazer", "~> 2.2"
  s.add_runtime_dependency "dalli", ">= 2.7.10"
  s.add_runtime_dependency "discard", "~> 1.2"
  s.add_runtime_dependency "redis", "~> 4.2"
  s.add_runtime_dependency "letter_opener", "~> 1.7"
  s.add_runtime_dependency "image_processing", "~> 1.0"
end
