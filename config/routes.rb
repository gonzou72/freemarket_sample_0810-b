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
  resources :buyers, only: [:index] do
    collection do
      post 'pay', to: 'buyers#pay'
      get 'done', to: 'buyers#done'
    end
  end
  resources :items, only: [:new,:create,:show,:edit,:update]
  resources :cards, only: [:new, :show] do
    collection do
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
  resources :mypages, only: [:index, :destroy]
  scope '/mypages' do
    resources :identifications, only: [:index, :create, :update]
    resources :profiles, only: [:edit]
  end
end