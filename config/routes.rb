Rails.application.routes.draw do
  resources :orders
  resources :products

  root "products#index"
end
