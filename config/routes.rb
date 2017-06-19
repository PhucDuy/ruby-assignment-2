Rails.application.routes.draw do
  root 'index' => 'home#index'
  resources :users
  resources :sections

end
