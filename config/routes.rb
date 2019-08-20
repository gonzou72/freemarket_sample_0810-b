Rails.application.routes.draw do
  root to: 'news#index'
    resources :news, only: [:index,:new,:create]
end
