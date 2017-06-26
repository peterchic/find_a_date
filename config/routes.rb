Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  root to: 'application#main'
  get '/users/:id/matches', to: 'users#matches', as: 'matches'
  get '/messages/new/:id', to: 'messages#new', as: 'new_message'
  post '/messages', to: 'messages#create'
  get '/messages/', to: 'messages#outbox', as: 'sent_messages'
  get '/messages/inbox', to: 'messages#inbox', as: 'received_messages'
  post '/users', to: 'users#create'
end
