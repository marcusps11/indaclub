Rails.application.routes.draw do

  resources :users
  resources :clubs
  resources :events

  resources :sessions, only: [:new, :create,:destroy]
  root "static#home"
  get "/login", to: "sessions#new"
  delete "/logout", to: "sessions#destroy"

  resources :events do
    member do
      put "like", to: "events#upvote"
    end
  end

end
