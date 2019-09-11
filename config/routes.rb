Rails.application.routes.draw do
  devise_for :users
  root to: 'news#index'
    resources :news, only: [:index,:new,:create]
    resources :items, only: [:new,:create]
    resources :mypages, only: [:index]
end
