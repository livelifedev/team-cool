Rails.application.routes.draw do
  devise_for :users
  get "/", to: "pages#home", as: "root"
  get "/documents", to: "documents#index"
  resource :documents	
  resources :users, only: [:index, :show, :edit, :update]
end
