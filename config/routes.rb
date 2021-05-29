Rails.application.routes.draw do
  root to: "topics#index"
  resources :topics, only: [:new, :create, :show]
end
