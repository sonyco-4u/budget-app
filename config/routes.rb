Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :home, only: [:index]
  resources :categories
  
  # root "articles#index"
  root 'home#index'
end
