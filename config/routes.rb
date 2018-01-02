Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: :show
  resources :products, only: [:new, :create]


  namespace :admin do
    resources :product_attributes, only: [:index, :create, :destroy]
  end
end
