Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post "/sessions", to: "sessions#create"
  post "/users", to: "sessions#logout"
  post "/users", to: "users#create"

  get "/players", to: "players#index"
  get "/players", to: "players#show"
  patch "/players/:id", to: "players#update"
  delete "/players/:id", to: "players#destroy"
end
