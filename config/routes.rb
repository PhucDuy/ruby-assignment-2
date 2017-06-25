
Rails.application.routes.draw do
  get 'index' => 'home#index'
  delete 'log_out' => 'sessions#destroy'
  resources :users
  resources :friendships, only: [:create,:destroy]
  resources :sessions, only: [:new, :create,:destroy]
  resources :messages
  root 'home#index'
end
