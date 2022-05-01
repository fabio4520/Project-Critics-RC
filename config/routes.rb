Rails.application.routes.draw do
  # resources :involved_companies
  resources :users
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
end
