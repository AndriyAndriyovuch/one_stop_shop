Rails.application.routes.draw do
  root "products#index"

  post "buy", to: "products#buy"
  delete "cancel_shipping/:id", to: "products#cancel_shipping", as:'cancel_shipping'

  resources :orders
  resources :products
end
