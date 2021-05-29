require "fileutils"
require "shellwords"


def add_config_method
  name = ask("What do you want to call your application?")
  description = ask("Enter a description. You can change this later, of course:")
  content = <<-RUBY
  def self.config
    {
      name: "#{name.present? ? name : 'My Awesome Application'}",
      short_name: "#{name.present? ? name : 'My App'}",
      description: "#{description.present? ? description : 'Young and wild.'}",

      theme_color: "#bd93ff",
      text_color: "#f7f7f7",
      secondary_text_color: "#aaa",
      background_color: "#444",
      accent_color: "#0097fc4f",
      border_radius: "5px"
    }
  end
    RUBY
  insert_into_file 'lib/front.rb', content + "\n", after: "module Front\n"
end


def add_layout
  content = <<-RUBY
<header>
  <nav>
    <%= link_to front.home_url do %>
      <%= image_tag "front/logo_180.png", width: 90 %>
    <% end %>
    <ul>
      <% if current_user %>
        <li><%= link_to_unless_current 'Account', main_app.account_url %></li>
      <% else %>
        <li><%= link_to_unless_current 'Login', main_app.new_user_session_url %></li>
      <% end %>
    </ul>
  </nav>

  <% flash.each do |name, msg| -%>
    <%= content_tag :sup, msg, class: name %>
  <% end %>
</header>

<main>
  <%= yield %>
</main>

<footer>
</footer>
    RUBY
  create_file 'app/views/layouts/front/application.html.erb', content + "\n"
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
add_layout
add_welcome
fix_javascript
add_config_method
add_helpers
