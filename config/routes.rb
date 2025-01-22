Rails.application.routes.draw do
  get "/authors/:vrchat_id", to: "authors#show"
  get "/tags/:name", to: "tags#show"
  get "/worlds/:vrchat_id", to: "worlds#show"
  get "/photos/:vrchat_id/:display_order", to: "photos#show"
  post "/photos", to: "photos#create"

  resources :authors
  resources :photos
  resources :tags
  resources :worlds

  post "/login", to: "sessions#create"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
