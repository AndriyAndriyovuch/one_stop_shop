class CartController < ApplicationController
  before_action :initialize_cart, :cart_params_valid?, only: %i[update]

  def show
    @cart = Cart::Storage.new(session, params)
  end

  def update
    service = Cart::ManagerService.new(session, cart_params)
    service.call

    redirect_back fallback_location: root_path, notice: (I18n.t "cart.notice.#{params[:action_type]}")
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
    unless cart_params[:id].present? &&
           cart_params[:id].to_i.is_a?(Integer) &&
           cart_params[:action_type].present? &&
           %w[add_product update_amount remove_product].include?(cart_params[:action_type])
      redirect_back fallback_location: root_path, alert: "Something went wrong" and return
    end
  end
end
