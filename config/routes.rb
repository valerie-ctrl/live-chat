Rails.application.routes.draw do
  devise_for :users
  root to: 'chatrooms#show', id: Chatroom.exists? ? Chatroom.first.id : nil
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  post "private-chatroom" => "chatrooms#create_private_chatroom"
  resources :chatrooms, only: %i[show create] do
    resources :messages, only: :create
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
