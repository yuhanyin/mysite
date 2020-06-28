Rails.application.routes.draw do
  get "sessions/new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy"
  get "signup" => "users#new"
  resources :users
end
