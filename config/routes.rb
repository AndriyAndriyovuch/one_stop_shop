Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root "products#index"

  resources :cart, only: [:index, :destroy]


  resources :products, only: [:index, :show] do
    member do
      resource :cart, only: [:update] do
        [:add, :remove, :update_amount].each do |action|
          post action, to: "cart#update", as: "#{action}_product_in", defaults: { action_type: action }
        end
      end
    end
  end

  resources :orders
end
