Rails.application.routes.draw do

  devise_for :users
  resources :users

  resources :birds do
    member do
      get 'next'
      get 'previous'
    end
  end

  get 'about', to: 'pages#about'
  get 'faq', to: 'pages#faq'
  get 'profile', to: 'users#profile'

  root "pages#landing"
end
