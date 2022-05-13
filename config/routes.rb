Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post "/sessions" => "sessions#create"

  get "/users/:id" => "users#show"
  post "/users" => "users#create"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"

  get "/accounts" => "accounts#index"
  get "/accounts/:id" => "accounts#show"
  post "/accounts" => "accounts#create"
  patch "/accounts/:id" => "accounts#update"
  delete "/accounts/:id" => "accounts#destroy"
end
