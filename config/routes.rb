Rails.application.routes.draw do
  get 'notifications/index'
  get 'walks/' => 'walks#index', as: "walks_json"
  post 'friendships/create' => 'friendships#create', as: 'friend_request'

  post 'friendships/update' => 'friendships#update', as: 'confirm_friend'
  get 'friendships' => 'friendships#index', as: "friends"
  resources :walks, only: [:show, :create, :update]
  resources :requests, only: [:index, :new, :create, :show, :edit, :destroy]
  resources :pets, only: [:index, :new, :create, :show, :edit, :update]
  devise_for :users, :controllers => { registrations: 'registrations', :omniauth_callbacks => 'users/omniauth_callbacks'}
  resources :users, only: [:show, :index]
  root "welcome#index"
end
