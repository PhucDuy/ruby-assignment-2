
Rails.application.routes.draw do
  get 'index' => 'home#index'
  delete 'log_out' => 'sessions#destroy'
  resources :users
  resources :sessions, only: [:new, :create,:destroy]

  root 'home#index'
end
