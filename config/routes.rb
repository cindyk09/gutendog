Rails.application.routes.draw do
  resources :walks, only: [:show, :create, :update]
  resources :requests, only: [:index, :new, :create, :show, :edit]
  resources :pets, only: [:index, :new, :create, :show, :edit, :update]
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show, :index]
  root "welcome#index"
end
