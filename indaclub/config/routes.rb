Rails.application.routes.draw do


  resources :clubs
  resources :events
  resources :users
  resources :sessions, only: [:new, :create,:destroy]
  root "static#home"
  get "/login", to: "sessions#new"
  delete "/logout", to: "sessions#destroy"



end
