Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  get 'home/about'

  root "home#index"

  get 'airlines/custom'
  
  resources :airlines do 
  resources :flights 
  end


  resources :passengers
  resources :bookings
end
