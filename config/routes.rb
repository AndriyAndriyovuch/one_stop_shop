Rails.application.routes.draw do
  root "products#index"

  get "cart", to: "cart#show", as: 'cart'
  post "buy", to: "cart#update", as: 'buy'
  post "change_amount", to: "cart#update", as: 'change_amount'
  post "cancel_shipping", to: "cart#update", as:'cancel_shipping'
  delete "clean_cart", to: "cart#delete", as: "clean_cart"

  resources :orders
  resources :products
end
