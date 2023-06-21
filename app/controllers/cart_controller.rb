class CartController < ApplicationController
  before_action :check_cart, only: %i[show]
  before_action :initialize_cart, only: %i[update]

  def show
    cart = Cart::Storage.new(session, params)

    @session_products = cart.products
    @session_sum = cart.sum
  end

  def update
    case cart_params[:update_action]

    when 'buy'
      Cart::AddProduct.call(session, params)
      redirect_to products_path, notice: "Product was added to cart."

    when 'change'
      Cart::UpdateAmount.call(session, params)
      redirect_to cart_path, notice: "Amount was changed"

    when 'delete'
      Cart::RemoveProduct.call(session, params)
      
      redirect_to cart_path, notice: "Product was removed" and return if session[:products].present?
      delete if session[:products].empty?
    end
  end

  def delete
    session.delete(:products)

    redirect_to products_path, notice: "Cart was cleaned"
  end

  private

  def cart_params
    params.permit(:id, :amount, :update_action)
  end

  def check_cart
    redirect_to root_path unless session[:products].present?
  end

  def initialize_cart
    session[:products] = {} unless session[:products].present?
  end
end
