class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :password, :first_name, :last_name, :address, :phone)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:email, :password, :first_name, :last_name, :address, :phone, :current_password)
    end
  before_action :get_products_count

  private

  def get_products_count
    @products_count = Cart::Storage.new(session).count_products
  end
end
