Rails.application.routes.draw do
  root "surf_spots#index"

  resources :surf_spots
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "signup", to: "users#new"

  resources :users, except: [:new]

  get     "login",  to: "sessions#new"
  post    "login",  to: "sessions#create"
  delete  "logout", to: "sessions#destroy"
end
