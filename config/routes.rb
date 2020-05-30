Rails.application.routes.draw do
  root "front/application#welcome"

  get "manifest.json" => "progressive#manifest"
  get "offline" => "progressive#offline"
  get "service-worker.js" => "progressive#service_worker"
  get "start" => "progressive#start"

  devise_for :users

  get "/account", to: "application#account"

  namespace :admin do
    resources :users
    root to: "users#index"
  end

  mount Front::Engine, at: "/"
end
