Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:index, :show, :new, :create, :edit, :destroy]


  # #sessions
  # get '/signin', to: 'sessions#new', as: 'login'
  # post '/signin', to: 'sessions#create', as: 'sessions'
  # get '/signout', to: 'sessions#destroy', as: 'logout'
  #
  # #users
  # get '/users', to: 'users#index', as: 'users'
  # get '/users/new', to: 'users#new'
  # post '/users', to: 'users#create'

end
