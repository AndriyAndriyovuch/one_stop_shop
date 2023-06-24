Rails.application.routes.draw do
  root "products#index"

  get "cart", to: "cart#show", as: 'cart'
  delete "clean_cart", to: "cart#delete", as: "clean_cart"

  resources :products, only: [:index, :show] do
    member do
      resource :cart do
        [:add, :remove, :update_amount].each do |action|
          post action, to: "cart#update", as: "#{action}_product_to"
        end
      end
    end
  end

  resources :orders
end
