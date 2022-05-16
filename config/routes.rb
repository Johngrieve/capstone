Rails.application.routes.draw do
  post "/sessions" => "sessions#create"

  get "/users" => "users#index"
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
