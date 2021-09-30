Rails.application.routes.draw do
root 'home#index'
resources :properties, only: [:show, :new, :create, :edit, :update]
resources :property_types, only: [:new, :create, :index, :show]
resources :property_locations, only: [:new, :create]


end
