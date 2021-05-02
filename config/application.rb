require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
require "puma"
require "pg"
require "sass-rails"
require "sprockets" if Rails.env.development?
require "devise"
require "turbo-rails"
require "administrate"
require "pundit"
require "ahoy"
require "blazer"
require "dalli"
require "redis"

module GhostRails
  class Application < Rails::Application
    config.load_defaults 6.1
  end
end
