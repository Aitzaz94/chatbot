Rails.application.routes.draw do
  get 'chats/index'
  get 'chats/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :chats
  resources :chat_messages, only: [:create]
end
