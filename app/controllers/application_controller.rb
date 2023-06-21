class ApplicationController < ActionController::Base
  before_action :count_products

  private

  def count_products
    @products_count = Cart::Storage.new(session).count_products
  end
end
