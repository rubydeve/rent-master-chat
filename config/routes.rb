Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  mount ActionCable.server, at: '/cable'
  resources :chats
  get '/dashboard', to: 'chats#index'
  root 'chatrooms#index'
end
