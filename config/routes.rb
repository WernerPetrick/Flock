Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :birds do
    member do
      get 'next'
      get 'previous'
    end
  end
  
  resources :users

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get 'about', to: 'pages#about'
  get 'faq', to: 'pages#faq'
  get 'join', to: 'pages#join'
  get 'login', to: 'pages#login'

  # Defines the root path route ("/")
  root "pages#landing"
end
