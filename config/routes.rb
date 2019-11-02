Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end

  root 'tops#index'
  resources :users

  resources :posts do
    collection do
      post :confirm
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  resource  :account, only: [:show, :edit, :update, :destroy]
end
