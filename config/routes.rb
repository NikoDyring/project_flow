Rails.application.routes.draw do
  devise_for :users

  root "#home#index" # Placeholder: create this controller later
  get "up" => "rails/health#show", as: :rails_health_check
end
