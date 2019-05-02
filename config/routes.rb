Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "pages#home", as: "root"
  resources :documents	
  resources :users, only: [:show, :edit, :update]
  #post "documents/:id/rate", to: "documents#rate", as: "rate_document"
