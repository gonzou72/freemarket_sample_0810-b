Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' } 
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
    resources :cards, only: [:new, :create, :show] do
      collection do
        post 'pay', to: 'cards#pay'
        post 'delete', to: 'cards#delete'
      end
    end
    resources :identifications, only: [:index, :create, :update]
    resources :profiles, only: [:edit]
  end
end