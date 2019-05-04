Rails.application.routes.draw do
  devise_for :users
  get "/", to: "pages#home", as: "root"
  get "/about", to: "pages#about", as: "about"
  get "/documents/results", to: "documents#results", as: "results"
  resources :documents do
    resources :comments, only: [:index, :create, :destroy]
    resources :bookmarks, only: [:index, :create, :destroy]
    resources :ratings, only: [:index, :create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  resources :questions do
    resources :answers
  end
end

