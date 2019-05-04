Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :subscriptions
  resources :library, only: [:index]
  resources :pricing, only: [:index]
  

  get "/", to: "pages#home", as: "root"
  get "/documents/results", to: "documents#results", as: "results"
  resources :documents do
    member do
      put 'add', to: "documents#library"
      put 'remove', to: "documents#library"
    end
    resources :comments, only: [:index, :create, :destroy]
    resources :bookmarks, only: [:index, :create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  post "documents/:id/rate", to: "documents#rate", as: "rate_document"
  resources :questions do
    resources :answers
  end
end
