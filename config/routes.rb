Rails.application.routes.draw do
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
end
