Rails.application.routes.draw do
  # constraints subdomain: "localhost:3000" do
  #   post '/:stripe' => 'pricing#webhook', as: :receive_webhooks
  # end

  get "/account", to: "accounts#index"
  post "/payments", to: "payments#stripe"
  get "/payments/success", to: "payments#success"

  devise_for :users, controllers: { registrations: "registrations" }
  get "/", to: "pages#home", as: "root"
  get "/about", to: "pages#about", as: "about"
  get "/documents/search", to: "documents#search", as: "search"
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

