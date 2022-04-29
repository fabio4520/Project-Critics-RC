Rails.application.routes.draw do
  # resources :involved_companies
  resources :users
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
  # root "articles#index"
end
