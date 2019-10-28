Rails.application.routes.draw do
  get 'accounts/show'
  get 'accounts/edit'
  root 'tops#index'
  resources :users

  resources :posts do
    collection do
      post :confirm
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  resource  :account, only: [:show, :edit, :update]
end
