Rails.application.routes.draw do
  root 'tops#index'
  resources :users
  resources :posts do
    collection do
      post :confirm
    end
  end
end
