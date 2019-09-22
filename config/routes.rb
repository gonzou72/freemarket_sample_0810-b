Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    namespace :users do
      resources :registrations, only: [:index, :new] do
        resources :phones ,only: [:new] 
        resources :addresses, only: [:new]
        resources :payments, only: [:new, :create]
      end
    end
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