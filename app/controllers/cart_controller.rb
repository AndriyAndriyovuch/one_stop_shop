class CartController < ApplicationController
  before_action :initialize_cart, only: %i[update]

  def show
    @cart = Cart::Storage.new(session, params)
  end

  def update
    service = Cart::Update.call(session, params)

    redirect_back fallback_location: root_path, notice: service
  end

  def delete
    session.delete(:products)

    redirect_to products_path, notice: "Cart was cleaned"
  end

  private

  def cart_params
    params.permit(:id, :amount, :update_action)
  end

  def initialize_cart
    session[:products] = {} unless session[:products].present?
  end
end
