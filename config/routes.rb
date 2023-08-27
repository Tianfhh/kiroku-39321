Rails.application.routes.draw do
  devise_for :users
  
  resources :entries, only: :index
end
