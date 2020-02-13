Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/", to: "clients#index"
  get "/sessions/results", to: "sessions#results"
  get "/sessions/search", to: "sessions#search"
  resources :users
  resources :clients
  resources :sessions
  

end
