Rails.application.routes.draw do
  get "/", to: "pages#home", as: "root"
  get "/profile", to: "accounts#profile"
  get "/accounts", to: "accounts#index"
  post "/payments", to: "payments#stripe"
  get "/payments/success", to: "payments#success"
  get "/admin", to: "accounts#admin"
  devise_for :users, :controllers => {:registrations => "registrations"}
  get "users", to: "users#index"
  delete "users/:id", to: "users#destroy"
  get "/about", to: "pages#about", as: "about"
  get "/contact", to: "pages#contact", as: "contact"
  get "/privacy", to: "pages#privacy", as: "privacy"
  get "/documents/search", to: "documents#search", as: "search"
  get "/documents/results", to: "documents#results", as: "results"
  resources :subjects
  resources :documents do
    resources :comments, only: [:index, :create]
    resources :bookmarks, only: [:index, :create]
    resources :ratings, only: [:index, :create, :destroy]
    put "/ratings", to: "ratings#update"
    patch "/ratings", to: "ratings#update"
  end
  delete "/comment/:id", to: "comments#destroy", as: "delete_comment"
  delete "/bookmark/:id", to: "bookmarks#destroy", as: "bookmark"
  resources :users, only: [:show, :edit, :update]
  resources :questions, except: [:index] do
    resources :answers
  end
end

