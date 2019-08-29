Rails.application.routes.draw do
  devise_for :users
  root to: 'news#index'
    resources :news, only: [:index,:new,:create]
end
