Rails.application.routes.draw do
  resources :involved_companies
  resources :companies
  resources :genres
  resources :platforms
  resources :games
  resources :critics
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
