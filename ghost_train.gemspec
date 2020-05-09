# frozen_string_literal: true

version = File.read(File.expand_path("VERSION", __dir__)).strip

Gem::Specification.new do |s|
  s.name        = "ghost_train"
  s.version     = version
  s.date        = "2020-05-09"
  s.summary     = "All aboard!"
  s.description = "I could've just used a ghost train."
  s.authors     = ["Thomas Hutterer"]
  s.email       = "tohu@tuta.io"
  s.homepage    = "https://rubygems.org/gems/ghost_train"
  s.license       = "MIT"

  s.executables << 'train'
  s.files       = ["lib/ghost_train.rb"]

  s.metadata = {
    "bug_tracker_uri"   => "https://github.com/thutterer/ghost_train/issues",
    "changelog_uri"     => "https://github.com/thutterer/ghost_train/releases/tag/v#{version}",
    "documentation_uri" => "https://github.com/thutterer/ghost_train/tree/v#{version}/README.md",
    "source_code_uri"   => "https://github.com/thutterer/ghost_train/tree/v#{version}",
  }
end
