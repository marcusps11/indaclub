Rails.application.routes.draw do
  resources :events
  resources :clubs
  resources :users
  root "events#index"

end
