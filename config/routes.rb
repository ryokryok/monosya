Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # root for devise
  root to: 'home#index'

  get 'home/about'

  # post routing
  resources :posts
end
