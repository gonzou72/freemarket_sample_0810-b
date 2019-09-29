Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' } 

  root to: 'items#index'
    resources :buyers, only: [:new,:create]
    resources :items, only: [:new,:create,:show]
    resources :signup, only: [] do
      collection do
        get 'step1', 'step2', 'step3', 'step4', 'step5', 'step6'
      end
    end

  resources :mypages, only: [:index, :destroy] 
  scope '/mypages' do
    resources :cards, only: [:index, :new]
    resources :identifications, only: [:index, :create, :update]
    resources :profiles, only: [:edit]
  end
end