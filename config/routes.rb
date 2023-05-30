Rails.application.routes.draw do
  get 'product_orders/create'
  delete 'product_orders/destroy'

  resources :orders
  resources :products

  root "products#index"
end
