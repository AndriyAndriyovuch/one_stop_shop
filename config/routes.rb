Rails.application.routes.draw do
  devise_for :users
  root "products#index"

  get "cart", to: "cart#show", as: 'cart'
  post "products/:id/buy", to: "cart#update", as: 'buy'
  post "products/:id/change_amount", to: "cart#update", as: 'change_amount'
  post "products/:id/cancel_shipping", to: "cart#update", as:'cancel_shipping'
  delete "clean_cart", to: "cart#delete", as: "clean_cart"

  resources :orders
  resources :products
end
