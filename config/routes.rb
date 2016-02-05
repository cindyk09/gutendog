Rails.application.routes.draw do
  post 'friendships/create' => 'friendships#create', as: 'friend_request'

  patch 'friendships/update' => 'friendships#update', as: 'confirm_friend'

  resources :walks, only: [:show, :create, :update]
  resources :requests, only: [:index, :new, :create, :show, :edit]
  resources :pets, only: [:index, :new, :create, :show, :edit, :update]
  devise_for :users, :controllers => { registrations: 'registrations', :omniauth_callbacks => 'users/omniauth_callbacks'}
  resources :users, only: [:show, :index]
  root "welcome#index"
end
