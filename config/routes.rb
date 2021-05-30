Rails.application.routes.draw do
  devise_for :users
  root to: "topics#index"
  resources :topics do
    resources :comments, only: [:new, :create]
  end
  resources :users, only: [:show]
end
