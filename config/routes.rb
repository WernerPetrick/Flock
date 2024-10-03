Rails.application.routes.draw do

  devise_for :users
  resources :users
  
  resources :birds do
    collection do
      post :mark_seen_birds
    end

    member do
      delete :remove_seen_bird
      get 'next'
      get 'previous'
    end
  end
  
  get 'about', to: 'pages#about'
  get 'faq', to: 'pages#faq'
  get 'profile', to: 'users#profile'

  post 'mark_seen_birds', to: 'birds#mark_seen_birds'

  root "pages#landing"
end
