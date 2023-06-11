Rails.application.routes.draw do
  root "products#index"

  get "cart", to: "products#cart"
  post "buy", to: "products#buy"
  post "change_amount", to: "products#change_amount"
  delete "cancel_shipping/:id", to: "products#cancel_shipping", as:'cancel_shipping'

  resources :orders
  resources :products
end
