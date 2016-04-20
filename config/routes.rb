Rails.application.routes.draw do
  resources :users
  resources :posts
  resources :comments, only: :create

  root 'sessions#new'

  get 'logout', to: 'sessions#destroy', as: 'logout'

  post '/sessions', to: 'sessions#create'

  get '/sign_up', to: 'users#new', as: 'sign_up'
end
