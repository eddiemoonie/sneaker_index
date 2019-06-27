Rails.application.routes.draw do
  root "static_pages#home"
  get "/", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
  resources :products
  resources :orders
  get "/carts/:id", to: "carts#show", as: "cart"
  delete "/carts/:id", to: "carts#destroy"
  post "/cart_items", to: "cart_items#create"
  get "/cart_items/:id", to: "cart_items#show", as: "cart_item"
  delete "/cart_items/:id", to: "cart_items#destroy"
  post "/shipping_informations", to: "shipping_informations#create"
end
