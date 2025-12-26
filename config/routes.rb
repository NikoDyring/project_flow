Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  authenticate :user do
    get "/dashboard", to: "dashboards#show"
    resources :projects do
      member do
        patch :archive
      end
    end
  end

  unauthenticated do
    root to: "home#index", as: :unauthenticated_root
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
