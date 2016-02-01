Rails.application.routes.draw do
  resources :walks, only: [:show, :create]
  resources :requests, only: [:new, :create, :show, :edit]
  resources :pets, only: [:index, :new, :create, :show, :edit, :update]
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show]
  root "welcome#index"
end
