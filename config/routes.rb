Rails.application.routes.draw do
  get 'index' => 'home#index'
  resources :users
  resources :sections
  root 'home#index'
end
