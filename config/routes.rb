Rails.application.routes.draw do
  devise_for :users
  # resources :involved_companies
  # resources :users
  resources :genres
  resources :platforms

  
  resources :games do 
    post "add_genre", on: :member
    post "add_platform", on: :member
    post "add_developer", on: :member
    post "add_publisher", on: :member
    delete "remove_genre", on: :member
    delete "remove_platform", on: :member
    delete "remove_developer", on: :member
    delete "remove_publisher", on: :member

    resources :critics, only: %i[create destroy]
  end

  resources :companies do
    resources :critics, only: %i[create destroy]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "games#index"

end
