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
  get "/subjects", to: "documents#subjects", as: "subjects"
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

