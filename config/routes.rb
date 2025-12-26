Rails.application.routes.draw do
  get "/dashboard", to: "dashboards#show", as: :dashboard
  devise_for :users

  root "home#index" # Placeholder: create this controller later
  get "up" => "rails/health#show", as: :rails_health_check
end
