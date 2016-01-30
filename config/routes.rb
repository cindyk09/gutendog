Rails.application.routes.draw do
  resources :pets, only: [:index, :new, :create, :show, :edit, :update]
  devise_for :users, controllers: { registrations: 'users/registrations', passwords: 'users/passwords' }
  resources :users, only: [:show]
  root "welcome#index"


 #  as :user do
 #   get 'login' => 'devise/sessions#new', :as => :new_user_session_path
 #   post 'login' => 'devise/sessions#create', :as => :user_session_path
 #   get 'users/sign_out', to: 'devise/sessions#destroy'
 #   get 'users/index', to: 'users#index'
 #   get 'users/:id/profile_page', to: 'users#show', :as => :profile_page_path
 # end

end
