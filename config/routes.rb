Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  resources :search, only: :index
end
