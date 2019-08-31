Rails.application.routes.draw do
  root to: 'news#index'
    resources :news, only: [:index,:new,:create]
    resources :items, only: [:new,:create]
end
