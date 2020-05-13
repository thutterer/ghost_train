 # TODO: Make sure this doesn't break when `rails` is called from a sub folder.
ENV['BUNDLE_GEMFILE'] ||= 'Gemfile'

require 'bundler/setup' # Set up gems listed in the Gemfile.

# TODO: Re-enable or remove.
# require 'bootsnap/setup' # Speed up boot time by caching expensive operations.
