Rails.application.routes.draw do
  devise_for :users

  get "/account", to: "application#account"

  namespace :admin do
    resources :users
    root to: "users#index"
  end

  mount Front::Engine, at: "/"
end
