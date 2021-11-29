Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] 
  resources :users, :only => [:index, :show]

  resources :relationships, only: [:create, :destroy]

  resources :cameras do  
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  
  
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]

  resources :maps
  root 'hello#index'
  resources :relationships, only: [:create, :destroy]

end