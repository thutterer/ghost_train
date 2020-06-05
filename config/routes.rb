Rails.application.routes.draw do
  get "manifest.json" => "progressive#manifest"
  get "offline" => "progressive#offline"
  get "service-worker.js" => "progressive#service_worker"
  get "start" => "progressive#start"
  root "progressive#start"

  devise_for :users

  get "/account", to: "application#account"

  namespace :admin do
    resources :users

    namespace :ahoy do
      resources :events
      resources :visits
    end

    root to: "users#index"
  end

  authenticate :user, ->(user) { user.admin? } do
    mount Blazer::Engine, at: "blazer"
  end

  mount Front::Engine, at: "/"
end
