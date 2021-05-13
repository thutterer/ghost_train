require "fileutils"
require "shellwords"

def add_config_method
  content = <<-RUBY
  def self.config
    {
      name: "My Awesome Application",
      short_name: "My app",
      description: "Young and wild.",
      theme_color: "#8338ec",
      background_color: "#FAFAFA"
    }
  end
    RUBY
  insert_into_file 'lib/front.rb', content + "\n", after: "module Front\n"
end

def add_welcome
  route 'get "home" => "application#welcome"'

  insert_into_file(
    'app/controllers/front/application_controller.rb',
    "    layout \"application\"\n\n    def welcome; end\n",
    after: "class ApplicationController < ActionController::Base\n"
  )

  welcome = <<-HTML
<header>
  <h1>Welcome aboard!</h1>
  <%- if User.count.zero? %>
    <p> Create your first user in the console. The first user will be admin.</p>
  <% end %>
</header>
  HTML
  create_file 'app/views/front/application/welcome.html.erb', welcome
end

def add_logos
  # TODO: call rake task
end

def fix_javascript
  create_file "app/assets/javascripts/front/application.js"
end

def add_helpers
  engine_name = <<-RUBY
    def engine_name
      "front"
    end
  RUBY

  insert_into_file 'app/helpers/front/application_helper.rb', engine_name, after: "module ApplicationHelper\n"
end

# Main setup
add_welcome
add_logos
fix_javascript
add_config_method
add_helpers
