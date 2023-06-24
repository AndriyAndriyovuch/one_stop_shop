class CartController < ApplicationController
  before_action :initialize_cart, only: %i[update]

  def show
    @cart = Cart::Storage.new(session, params)
  end

  def update
    if cart_params_valid?
      service = Cart::ManagerService.new(session, cart_params)
      service.call

      redirect_back fallback_location: root_path, notice: (I18n.t "cart.notice.#{params[:action_type]}")
    else
      redirect_back fallback_location: root_path, alert: "Something went wrong"
    end
  end

  def delete
    session.delete(:products)

    redirect_to products_path, notice: "Cart was cleaned"
  end

  private

  def cart_params
    params.permit(:id, :amount, :action_type)
  end

  def initialize_cart
    session[:products] = {} unless session[:products].present?
  end

  def cart_params_valid?
    return false unless cart_params[:id].present? && cart_params[:id].to_i.is_a?(Integer)
    return false unless cart_params[:action_type].present? && %w[add_product update_amount remove_product].include?(cart_params[:action_type])

    true
  end
end
