Rails.application.routes.draw do

  devise_for :users, controllers: { 
    registrations: 'users/registrations' ,
    omniauth_callbacks: 'users/omniauth_callbacks'
  } 
  devise_scope :user do
    namespace :users do
      resources :addresses, only: [:index, :create]
      resources :creditcards, only: [:index]
      resources :phones, only: [:index]
      resources :signup, only: [:index, :new, :create] 
    end
  end

  root to: 'items#index'
    resources :buyers, only: [:new,:create]
    resources :items, only: [:new,:create,:show]

  resources :mypages, only: [:index, :destroy] 
  scope '/mypages' do
    resources :cards, only: [:index, :new]
    resources :identifications, only: [:index, :create, :update]
    resources :profiles, only: [:edit]
  end
end