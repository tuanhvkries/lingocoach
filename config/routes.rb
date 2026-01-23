Rails.application.routes.draw do
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :exercises, only: [:index, :show, :new, :create, :destroy] do
    resources :chats, only: [:create]
  end

  resources :chats, only: [:index, :show, :destroy] do
    resources :messages, only: [:create]
  end

  resources :messages, only: [:destroy]
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
