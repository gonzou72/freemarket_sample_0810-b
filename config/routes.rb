Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' } 
  devise_scope :user do
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
    get 'step1_top', to: 'users/registrations#step1_top', as: 'step1_top'
    get 'step2_mail', to: 'users/registrations#step2_mail', as: 'step2_mail'
    get 'step3_tel', to: 'users/registrations#step3_tel', as: 'step3_tel'
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
