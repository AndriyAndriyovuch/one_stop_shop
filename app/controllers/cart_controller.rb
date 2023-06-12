class CartController < ApplicationController
  def show
    return unless session[:products]

    current_session = Cart::Session.new(session)
    @session_products = current_session.products
    @session_sum = current_session.sum
  end

  def create
    session[:products] = {}
  end

  def update
    create unless session[:products].present?

    modify_product

    delete if session[:products].empty?
  end

  def delete
    session.delete(:products)

    redirect_to products_path, notice: "Cart was cleaned"
  end

  private

  def modify_product
    case params[:update_action]

    when 'buy'
      Cart::Session.new(session, params).add_product
      redirect_to products_path, notice: "Product was added to cart."

    when 'change'
      Cart::Session.new(session, params).set_new_amount
      redirect_to cart_path, notice: "Amount was changed"

    when 'delete'
      Cart::Session.new(session, params).delete_product
      redirect_to cart_path, notice: "Product was removed"
    end
  end
end
