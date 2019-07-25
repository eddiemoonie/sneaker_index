Rails.application.routes.draw do
  root "products#index"
  get "/login", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users, only: [:show, :update, :destroy ]
  get "/signup", to: "users#new"
  post "/users", to: "users#create"
  resources :products
  resources :orders
  resources :reviews
  get "/cart", to: "carts#show", as: "cart"
  delete "/carts/:id", to: "carts#destroy"
  post "/cart_items", to: "cart_items#create"
  get "/cart_items/:id", to: "cart_items#show", as: "cart_item"
  delete "/cart_items/:id", to: "cart_items#destroy"
  post "/shipping_informations", to: "shipping_informations#create"
  post "/payment_informations", to: "payment_informations#create"
  get "/favorites", to: "favorites_lists#show"
  post "/favorited_products", to: "favorited_products#create"
end
