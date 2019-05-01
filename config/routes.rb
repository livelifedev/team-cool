Rails.application.routes.draw do
  devise_for :users
  get "/", to: "pages#home", as: "root"
  resources :documents	
  resources :users, only: [:show, :edit, :update]
  post "documents/:id/rate", to: "documents#rate", as: "rate_document"
end
