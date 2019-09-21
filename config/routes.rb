Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' } 
  devise_scope :user do
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end

  root to: 'items#index'
    resources :items, only: [:new,:create,:show]
    resources :mypages, only: [:index] do
      collection do
        get :profile, :identification
        patch :identification_update
        post :identification_create
      end
    end
end
