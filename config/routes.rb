Rails.application.routes.draw do
  devise_for :users
  root "surf_spots#index"

  resources :surf_spots
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
