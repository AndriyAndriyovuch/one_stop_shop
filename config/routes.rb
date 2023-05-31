Rails.application.routes.draw do
  root "products#index"

  get 'product_orders/create'
  delete 'product_orders/destroy'

  resources :orders
  resources :products
end
