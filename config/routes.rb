Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' } 
  devise_scope :user do
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end

  root to: 'news#index'
    resources :news, only: [:index,:new,:create]
    resources :items, only: [:new,:create]
    resources :mypages, only: [:index] do
      collection do
        get :profile
      end
    end
end
