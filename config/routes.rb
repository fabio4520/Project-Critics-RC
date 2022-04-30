Rails.application.routes.draw do
  devise_for :users
  # resources :involved_companies
  # resources :users
  resources :genres
  resources :platforms
  
  resources :games do 
    resources :critics, only: %i[create destroy]
  end
  
  resources :companies do 
    resources :critics, only: %i[create destroy]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "games#index"
  # get "/profile", to: "users#show", as: "user"
end
