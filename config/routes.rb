Rails.application.routes.draw do
  devise_for :admins, controllers:  {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: "bicycle_parkings#index"
  end
  root "map#index"
end
