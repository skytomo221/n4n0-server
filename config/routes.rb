Rails.application.routes.draw do
  get "/authors/:vrchat_id", to: "authors#show"
  get "/tags", to: "tags#index"
  get "/tags/:name", to: "tags#show"
  get "/portraits", to: "portraits#index"
  get "/portraits/sample", to: "portraits#sample"
  get "/portraits/:id", to: "portraits#show"
  get "/portraits/:id/photo", to: "portraits#show_photo"
  get "/photos/latest", to: "photos#show_latest"
  get "/photos/:vrchat_id/:display_order", to: "photos#show"
  post "/photos", to: "photos#create"
  get "/world_guides", to: "world_guides#index"
  get "/world_guides/sample", to: "world_guides#sample"
  get "/world_guides/:vrchat_id", to: "world_guides#show"

  post "/login", to: "sessions#create"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
