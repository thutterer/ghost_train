class GhostGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  def do_your_thing
    gsub_file File.expand_path("front/front.gemspec", Dir.pwd), /TODO: /, ''
    gsub_file File.expand_path("front/front.gemspec", Dir.pwd), /TODO/, 'https://example.com'
    gsub_file File.expand_path("front/front.gemspec", Dir.pwd), '  spec.metadata["source_code_uri"] = "Put your gem\'s public repo URL here."', ''
    gsub_file File.expand_path("front/front.gemspec", Dir.pwd), '  spec.metadata["changelog_uri"] = "Put your gem\'s CHANGELOG.md URL here."', ''
  end
end
