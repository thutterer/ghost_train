Rails.application.routes.draw do
  # root 'application#welcome'
  devise_for :users

  get "/account", to: "application#account"

  namespace :admin do
    resources :users
    root to: "users#index"
  end
end


# Provide the absolute path to your application's config folder as an ENV var.
require File.join(ENV["CONFIG_DIR"], "routes.rb") if ENV["CONFIG_DIR"].present?
