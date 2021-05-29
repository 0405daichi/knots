Rails.application.routes.draw do
  devise_for :users
  root to: "topics#index"
  resources :topics, only: [:new, :create, :show, :edit, :update, :destroy]
end
