Rails.application.routes.draw do
  root 'tops#index'
  resources :users
  resources :posts
end
