Rails.application.routes.draw do
  get "password_resets/new"
  get "password_resets/edit"
  get "sessions/new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "products#index"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  get "signup" => "users#new"
  resources :users
  # get "/account_activations/:id/edit", to: "account_activations#edit"
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :products

  resources :orders
  get "orders/:id/state/:next_state", to: "orders#change"
end
