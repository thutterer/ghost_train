require "fileutils"
require "shellwords"

def add_config_method
  content = <<-RUBY
  def self.config
    {
      theme_color: "#A63446"
    }
  end
    RUBY
  insert_into_file 'lib/front.rb', content + "\n", after: "module Front\n"
end

def add_welcome
  route 'get "home" => "application#welcome"'
  insert_into_file 'app/controllers/front/application_controller.rb', 'def welcome; end', after: "class ApplicationController < ActionController::Base\n"
  create_file 'app/views/front/application/welcome.html.erb', 'Hello there!'
end

def add_logos
  create_file 'app/assets/images/front/logo_192.png'
  create_file 'app/assets/images/front/logo_512.png'
  create_file 'app/assets/images/front/logo_large.png'
end

def fix_javascript
  create_file "app/assets/javascripts/front/application.js"
end

# Main setup
add_welcome
add_logos
fix_javascript
add_config_method
