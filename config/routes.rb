Rails.application.routes.draw do
  devise_for :users
  root to: "topics#index"
  resources :topics
  resources :users, only: [:show]
end
