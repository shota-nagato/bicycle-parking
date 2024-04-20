Rails.application.routes.draw do
  require "sidekiq/web"
  mount Sidekiq::Web, at: "/sidekiq"

  devise_for :admins, controllers:  {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: "dashboard#index"
    resources :bicycle_parkings
  end
  root "map#index"
  resources :search, only: :index
  resources :about, only: :index

  get "*not_found" => "application#routing_error"
end
